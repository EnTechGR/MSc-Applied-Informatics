from ast import dump
import asyncio
from h11 import Data
import websockets
import json
from datetime import datetime, timezone
import csv

#
# To improve this code and adhere to Python good practices,
# we'll add comments explaining each section and suggest
# improvements like using environment variables for sensitive
# data, handling exceptions, and using a DictWriter for CSV files.
#

# We're importing several modules here:
# asyncio for asynchronous I/O, websockets for the connection,
# json for data serialization, datetime and timezone for timestamps,
# and csv for writing to a CSV file.
# The `dump`, `h11.Data` imports are not used and should be removed.

async def connect_ais_stream():
    """
    Connects to the AISStream WebSocket, subscribes to ship data,
    and saves the received messages to a CSV file.
    """
    # Use a context manager for the WebSocket connection.
    # The 'async with' statement ensures the connection is properly closed,
    # even if an error occurs.
    try:
        async with websockets.connect("wss://stream.aisstream.io/v0/stream") as websocket:
            # TODO: Use an environment variable for the API key to keep
            # it secure and avoid hardcoding it in the script.
            # Example: os.environ.get("AISSTREAM_API_KEY")
            subscribe_message = {
                "APIKey": "<API_KEY>",
                # The bounding box defines the geographical area of interest.
                # It's a list of two points: [[min_lat, min_lon], [max_lat, max_lon]]
                "BoundingBoxes": [[[3, 29], [38, 43]]],
                # We're only filtering for "ShipStaticData" messages, which
                # contain static information about vessels.
                "FilterMessageTypes": ["ShipStaticData"]
            }

            subscribe_message_json = json.dumps(subscribe_message)
            await websocket.send(subscribe_message_json)
            
            # Use `csv.DictWriter` for a more readable and robust way to
            # handle CSV files. It maps dictionaries to rows, which is
            # ideal for structured data like this.
            csv_file_path = 'data.csv'
            # The 'a' mode appends to the file, and `newline=''`
            # is crucial to prevent blank rows between entries.
            with open(csv_file_path, 'a', newline='') as csv_file:
                # Define the fieldnames (column headers) for the CSV.
                fieldnames = [
                    'time_utc', 'CallSign', 'ShipName', 'Type', 'ImoNumber',
                    'MMSI', 'latitude', 'longitude', 'Destination', 'FixType',
                    'DimensionA', 'DimensionB', 'DimensionC', 'DimensionD',
                    'MaximumStaticDraught', 'MessageID'
                ]
                
                # Create a DictWriter instance and write the header row
                # if the file is new. A simple check for file existence
                # can prevent writing the header multiple times.
                # Or, even better, check if the file is empty before writing the header.
                csv_writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
                
                # If the file is empty, write the header row.
                if csv_file.tell() == 0:
                    csv_writer.writeheader()

                # Asynchronously iterate over incoming WebSocket messages.
                async for message_json in websocket:
                    # Parse the JSON message from the stream.
                    message = json.loads(message_json)
                    
                    message_type = message.get("MessageType")
                    
                    # We've already filtered for `ShipStaticData` messages,
                    # but this check adds an extra layer of safety.
                    if message_type == "ShipStaticData":
                        # Extract the nested data and metadata.
                        ais_message = message['Message']['ShipStaticData']
                        ais_metadata = message['MetaData']
                        
                        # Merge the two dictionaries for a single, comprehensive record.
                        # This can be done more cleanly with a new dictionary.
                        # For example: `record = {**ais_message, **ais_metadata}`
                        ais_message.update(ais_metadata)

                        # Flatten the 'Dimension' dictionary for easier CSV writing.
                        # This avoids the need for nested key lookups and makes the code cleaner.
                        dimensions = ais_message.pop('Dimension')
                        ais_message['DimensionA'] = dimensions.get('A')
                        ais_message['DimensionB'] = dimensions.get('B')
                        ais_message['DimensionC'] = dimensions.get('C')
                        ais_message['DimensionD'] = dimensions.get('D')

                        # Write the prepared dictionary to the CSV file.
                        csv_writer.writerow(ais_message)

    # Use a broad `except` block to catch any exceptions and
    # ensure the program exits gracefully. It's a good practice
    # to log the error to understand what went wrong.
    except websockets.exceptions.ConnectionClosed as e:
        print(f"Connection closed: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

# The `if __name__ == "__main__":` block is a standard Python
# practice. It ensures that the code inside it only runs when the
# script is executed directly (not when imported as a module).
if __name__ == "__main__":
    asyncio.run(connect_ais_stream())