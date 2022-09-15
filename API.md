*Show Doctors*
----
  Returns json data about all doctors.

* **URL**

  /doctors/index

* **Method:**

  `GET`
  
*  **URL Params**

  None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
                    {
                      "id": 1,
                      "name": "some name",
                      "specialization": "dogs",
                      "experience": 3,
                      "created_at": "2022-09-15T14:53:59.443Z",
                      "updated_at": "2022-09-15T14:53:59.443Z",
                      "price": 2.5
                    }
                  ]`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/doctors/index",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```
