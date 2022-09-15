*Login/Sign in user*
----
  Retrieves user info based on the username or creates it if nonexistent.

* **URL**

  /users/create

* **Method:**

  `POST`
  
*  **URL Params**

  None

* **Data Params**

  {user: {name: "STRING"}}

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
  "id": 2,
  "name": "STRING",
  "created_at": "2022-09-15T15:53:34.780Z",
  "updated_at": "2022-09-15T15:53:34.780Z"
}`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      type: 'POST',
      url: '/users/create',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify({user: {name: "STRING"}}),
      success: function(json) { }
    });
  ```

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

*Create Doctor*
----
  Creates a Doctor instance.

* **URL**

  /doctors/create

* **Method:**

  `POST`
  
*  **URL Params**

  None

* **Data Params**

  { doctor: {"name": "STRING", "specialization": "STRING", "experience": INTEGER, "price": FLOAT}}

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `Succesfully created`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      type: 'POST',
      url: '/doctors/create',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify({ doctor: {"name": "some name", "specialization": "dogs", "experience": 3, "price": 2.5}}),
      success: function(json) { }
    });
  ``

*Delete Doctor*
----
  Deletes a Doctor instance.

* **URL**

  /doctors/delete

* **Method:**

  `DELETE`
  
*  **URL Params**

  None

* **Data Params**

  { doctor: {"id": INTEGER}}

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `Successfully deleted`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      type: 'DELETE',
      url: '/doctors/delete',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify({ doctor: {"id": 1}}),
      success: function(json) { }
    });
  ``