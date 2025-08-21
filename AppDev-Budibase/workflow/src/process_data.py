from src.get_data import ap23011

data = ap23011()
table_data = data.get_table_data()

# Iterrate over each data
for i in range(len(table_data['data'])):
    # Create empty dictionairies for data save
    journals = {}
    conferences = {}
    # Print user's name
    print(table_data['data'][i]["Name"])
    # Count journals
    for line in table_data['data'][i]["Journals"]:
        if line['primaryDisplay'] not in journals:
            journals[line['primaryDisplay']] = 0
        journals[line['primaryDisplay']] +=1
    # Count Conferences
    for line in table_data['data'][i]["Conferences"]:
        if line['primaryDisplay'] not in conferences:
            conferences[line['primaryDisplay']] = 0
        conferences[line['primaryDisplay']] +=1
    # Empty line
    print()
    # Find the common years sorted from latest to earlier
    all_years = sorted(set(journals.keys()) | set(conferences.keys()), reverse=True)
    # Return data
    for year in all_years:
        print("Χρονιά:", year)
        if year in journals:
            print("Περιοδικά:", journals[year])
        if year in conferences:
            print("Συνεδρια:", conferences[year])
        print()