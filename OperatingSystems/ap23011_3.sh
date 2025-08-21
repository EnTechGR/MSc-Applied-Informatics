#!/bin/bash
#===============================================================================
#
#          FILE: ap23011_3.sh
# 
#         USAGE: ./ap23011_3.sh 
# 
#   DESCRIPTION: This shell script is a contact mini app. Displays an action menu to select.
#                Data is stored in a file named "contacts.list" in the working directory.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marinos Kouvaras (ap23011), ap23011@hua.gr
#  ORGANIZATION: ---
#       CREATED: 14/1/2023
#      REVISION: v1
#===============================================================================

# Specify the file we want our data to be stored
FILE=./contacts.list

#The intro message function with the available options
message () {
    echo "######## CONTACT APP ###########"
    echo "# 1. Insert Contact            #" 
    echo "# 2. Delete Contact            #"
    echo "# 3. Modify Contact            #"
    echo "# 4. Search Contact            #"
    echo "# 5. Sort Contacts by LastName #"
    echo "# 6. Sort Contacts by FirstNam #"
    echo "# 7. Quit                      #"
    echo "######## CONTACT APP ###########"
}

# Function for data insert
insert_contact () {
    while true;
    do
    #Ask for data entry
    echo "Insert <firstname>,<lastname>,<phone1>,<phone2>"
    #Set space delimiter
    IFS=","
    # Read the inputs
    read -a inputs firstname lastname phone1 phone2
    #Check that 4 data fields are entered and that name,surname are alphabetic characters and phones are numbers
    if [[ "${#inputs[@]}" -eq  4 && "${inputs[0]}" =~ ^[a-zA-Z]+$ && "${inputs[1]}" =~ ^[a-zA-Z]+$ && "${inputs[2]}" =~ ^[0-9]+$ && "${inputs[3]}" =~ ^[0-9]+$ ]];
    then
        #Write data with the specified format
        NEW_CONTACT=${inputs[0]}', '${inputs[1]}', '${inputs[2]}', '${inputs[3]}
        # Append contact to the file
        echo "$NEW_CONTACT">>$FILE
        #Inform user that data entry is completed
        echo "Contact inserted"
        break        
    fi
    # Notify for bad input and continue prompting until success entry
    echo "Bad input"
    done
}

# Function for data deletion
delete_contact () {
    # Insert lastname
    read -p "Insert lastname of the contact to be deleted: " LASTNAME
    # Search contact by its last name
    RESULT=$(awk -F ', ' -v last_name="$LASTNAME" '$2 == last_name {print NR, $0}' $FILE)    
    #If there is a contact return result
    if [ "${RESULT}" ] 
    then
        #Print the result
        echo "$RESULT"
        #Prompt user to select the contact he wants
        read -p "Which contact to delete, insert the left row line? " LINE
        #Confirm action
        read -p "Are you sure Y/N? " OPTION
        if [[ $OPTION == "Y" || $OPTION == "y" ]]
        then
            #Delete contact line
            sed -i "${LINE}d" $FILE
            #Upadte file with deleting empty line
            sed '/^$/d' $FILE
            #Inform user
            echo "Contact deleted"
        #Exit function
        else [[ $OPTION == "N" || $OPTION == "n" ]]
            return
        fi
    else
        echo "No contacts found"
    fi
}

# Function for data update
modify_contact () {
    # Search contact by its lastname
    read -p "Insert lastname of the contact to be modified: " LASTNAME
    #Search contact by its lastname
    RESULT=$(awk -F ', ' -v last_name="$LASTNAME" '$2 == last_name {print NR, $0}' $FILE)
    if [ "${RESULT}" ] 
    then
        echo "$RESULT"
        read -p "Which contact to be modified? " LINE
        #save the contact to be replaced in a variable
        OLD_CONTACT=$(awk NR=="$LINE" "$FILE")
        read -p "Are you sure Y/N? " OPTION
        if [[ $OPTION == "Y" || $OPTION == "y" ]]
        then
            while true;
            do
            # Ask for data entry
            echo "Insert <firstname>,<lastname>,<phone1>,<phone2>"
            # Set space delimiter
            IFS=","
            # Read the inputs
            read -a inputs firstname lastname phone1 phone2
            # Check that 4 data fields are entered and that name,surname are alphabetic characters and phones are numbers
            if [[ "${#inputs[@]}" -eq  4 && "${inputs[0]}" =~ ^[a-zA-Z]+$ && "${inputs[1]}" =~ ^[a-zA-Z]+$ && "${inputs[2]}" =~ ^[0-9]+$ && "${inputs[3]}" =~ ^[0-9]+$ ]];
            then
                #Write data with the specified format
                NEW_CONTACT=${inputs[0]}', '${inputs[1]}', '${inputs[2]}', '${inputs[3]}                
                #Replace the old contact with the new
                sed -i "${LINE}s|$OLD_CONTACT|$NEW_CONTACT|" "$FILE"
                echo "Contact modified"
                break        
            fi
            # Notify for bad input and continue prompting until success entry
            echo "Bad input"
            done            
        else [[ $OPTION == "N" || $OPTION == "n" ]]
            return
        fi        
    else
        echo "No contacts found"
    fi
}

# Function for data search
search () {
    read -p "Insert firstname or lastname or phone of the contact: " FIELD
    # Search for matching word
    RESULT=$(grep -inw "$FIELD" "$FILE")
    if [[ $RESULT ]]
    then
        echo "Contacts found"
        echo "$RESULT"
    else
        echo "No contacts found"
    fi
}

# Function for sort by name
sort_name () {
    sort -t ',' -k1 -o $FILE $FILE
    echo "Contacts sorted by name"
    echo "$(cat $FILE)"
}

# Function for sort by lastname 
sort_lastname() {
    sort -t ',' -k2 -o $FILE $FILE
    echo "Contacts sorted by lastname"
    echo "$(cat $FILE)"
}

while true; do
    message
    read -p "What do you want to do? " SELECTION
    case "$SELECTION" in
        1)
        insert_contact        
        ;;
        2)
        delete_contact
        ;;
        3)
        modify_contact
        ;;
        4)
        search
        ;;
        5)
        sort_name
        ;;
        6)
        sort_lastname
        ;;
        7)
        exit
        ;;
        *)
        echo "Invalid option"
        ;;
    esac
done