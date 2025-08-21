// This function gets the data
function getData() {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                // Get the data
                let data = JSON.parse(xhr.responseText);
                createTable(data);
                createList(data);
                //Create modal variable
                let modal = document.getElementById("myModal");
                // Create span variable
                let span = document.getElementsByClassName("close")[0];
                // Create list selection variable
                let myListSelection = document.getElementById("prod_id");
                // Manipulate modal
                myListSelection.addEventListener("change", function() {
                    modal.style.display = "block";
                    myModal(data["products"], myListSelection);
                });
                span.onclick = function() {
                    modal.style.display = "none";
                }
                window.onclick = function(event) {
                    if (event.target === modal) {
                        modal.style.display = "none";
                    }
                }
            } else {
                console.log("Request error " + xhr.status + " " + xhr.statusText);
            }
        }
    };
    xhr.open("GET", "https://dummyjson.com/products", true)
    xhr.send(null);
}

// This function constructs our data table
function createTable(data) {
    // Create a table
    let createTable = "<table>";
    // Create the table head
    createTable += "<tr><th>ID</th><th>Title</th><th>Description</th><th>Price</th></tr>"
    // Iterate over each item and add into table & list
    for (let i = 0; i < data["products"].length; i++){
        createTable += `<tr>
                            <td>${data["products"][i].id}</td>
                            <td>${data["products"][i].title}</td>
                            <td>${data["products"][i].description}</td>
                            <td>${data["products"][i].price}</td>
                        </tr>`
    }
    // Close table
    createTable += "</table>"
    // add the table into the page
    let productTable = document.getElementById("productTable")
    productTable.innerHTML = createTable;
}

// This function constructs the selection list
function createList(data) {
    // Create selection list
    let createList = "<select name='prod_id' id='prod_id'>";
    createList += "<option value='0'>Select ID:</option>";
    // Iterate over each item and add into table & list
    for (let i = 0; i < data["products"].length; i++){
        createList += `<option value="${data["products"][i].id}">${data["products"][i].id}</option>`
    }
    // Close selection list
    createList += "</select>"
    // add the list into the page
    let selectID = document.getElementById("selectID")
    selectID.innerHTML = createList;
}


// Custom modal
function myModal(myObj, list){
    // Get the selection
    let numList = list.value
    // Find the data
    let myValue = myObj[numList-1]
    // Select modal
    let modal = document.getElementById("myModal")[0];
    // Construct the modal message
    let myInfo = document.getElementById("myInfo")
    myInfo.innerHTML = `<p>ID: ${myValue.id}</p>` +
                        `<p>Title: ${myValue.title}</p>` +
                        `<p>Description: ${myValue.description}</p>` +
                        `<p>Price: ${myValue.price}</p>`+
                        `<img src=${myValue.images[0]} alt="product_image" style="width:150px;height:150px;">`
    modal.style.display = "block";
}


// This function checks data integrity
function dataCheck() {
    // Get title
    let title = document.getElementById("title")
    // Get company
    let company = document.getElementById("company")
    // Allow only for alphabetic characters + greek lang
    title.addEventListener("input", function () {
        title.value = title.value.replace(/[^a-zA-Z\sα-ωΑ-Ω]/g, '');
    })
    // Allow only for alphabetic characters + greek lang
    company.addEventListener("input", function () {
        company.value = company.value.replace(/[^a-zA-Z\sα-ωΑ-Ω]/g, '');
    })
    // Select message field
    let info_message = document.getElementById("info_message")
    // Check for null or only spaces
    if (title.value.trim().length === 0 || company.value.trim().length === 0) {
        info_message.innerHTML = "<p>Title or Company has only spaces or null data.</p>"
    }else{
        info_message.innerHTML = ""
        return [title.value, company.value]
    }

}

function postData() {
    // Construct object
    let product = {
        //Remove any space after or before
        title: dataCheck()[0].trim(),
        company: dataCheck()[1].trim()
    };
    let info_message = document.getElementById("info_message")

    const xhr = new XMLHttpRequest();
    // Inform in case there was no connection
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 201) {
                info_message.innerHTML += `<p>Connection: OK <br> You data sent successfully <br> Title: ${product.title}</p>`
            } else {
                info_message.innerHTML += `<p>Connection: FAILED <br> Please try again later</p>`
            }
        }
    };
    xhr.open("POST", "https://dummyjson.com/products/add", true)
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    // Post the data
    xhr.send(JSON.stringify(product));
}


