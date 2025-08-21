# Data Management & Analytics Project

This project, developed as part of the "Data Management" course at Charokopio University, demonstrates the implementation of a data management and analytics system using Python. The primary goal is to retrieve and analyze publication data from a Budibase application, a low-code platform, to provide a structured overview of research output.

## Project Description

The system is designed to connect to a web application's public API to access data from three interconnected tables: `Research_Staff`, `Journal`, and `Conference`. The Python scripts in this repository automate the process of:

* Establishing a connection to the Budibase API using a public access key.

* Fetching data from the specified tables.

* Processing the retrieved data to count the number of publications in journals and conferences per year.

* Presenting the processed data in a clear, readable format in the console.

## Project Structure

The repository contains the following key files:

* **`process_data.py`**: This is the main script that orchestrates the data retrieval and analysis. It calls the `get_data.py` module to fetch data and then processes it to generate the final output.

* **`get_data.py`**: A utility script that handles all API communication with the Budibase application. It contains the necessary functions to construct API requests and retrieve raw table data.

* **`requirements.txt`**: A list of all necessary Python libraries for the project.

* **`ap23011_report.pdf`**: The official project report submitted for the course, containing a detailed walkthrough of the application design and implementation. You can view the report by clicking [**here**](https://drive.google.com/file/d/14veQ5CDIjMyFM8YzJlf52GPhvQVYjTWV/view?usp=drive_link).

## Getting Started

### Prerequisites

You will need Python 3 installed on your system. All other required libraries are listed in `requirements.txt`.

### Installation

1. Clone this repository to your local machine:
