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
    **Content:** `Successfully created`
 
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

*Show Appointments*
----
  Returns json data about all appointments for a respective user.

* **URL**

  /appointments/index

* **Method:**

  `GET`
  
*  **URL Params**

  None

* **Data Params**

  {"appointment": { "user_id": 1}}

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
  {
    "id": 2,
    "user_id": 1,
    "doctor_id": 3,
    "date": "2012-08-29T22:35:00.000Z",
    "created_at": "2022-09-15T16:19:51.466Z",
    "updated_at": "2022-09-15T16:19:51.466Z",
    "city": "Bogotá"
  }
]`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/appointments/index",
      dataType: "json",
      type : "GET",
      data: JSON.stringify({"appointment": { "user_id": 1}}),
      success : function(r) {
        console.log(r);
      }
    });
  ```

*Create Appointment*
----
  Creates a Appointment instance.

* **URL**

  /appointments/create

* **Method:**

  `POST`
  
*  **URL Params**

  None

* **Data Params**

  { "appointment": {
    "user_id": INT,
    "doctor_id": INT,
    "city": "STRING",
    "date": "YYYY-MM-DDThh:mm:ss.sssZ"
    }
  }

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `Successfully created`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      type: 'POST',
      url: '/doctors/create',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify({ "appointment": {
                              "user_id": 1,
                              "doctor_id": 3,
                              "city": "Bogotá",
                              "date": "2022-09-15T17:20:14.372Z"

                              }
                            }),
      success: function(json) { }
    });
  ``

*Delete Appointment*
----
  Deletes a appointment instance.

* **URL**

  /appointments/delete

* **Method:**

  `DELETE`
  
*  **URL Params**

  None

* **Data Params**

  { appointment: {"id": INTEGER}}

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `Successfully deleted`
 
* **Sample Call:**

  ```javascript
    $.ajax({
      type: 'DELETE',
      url: '/appointments/delete',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify({ appointment: {"id": 1}}),
      success: function(json) { }
    });
  ``
