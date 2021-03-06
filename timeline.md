## 7th February 2017

### In attendance
> Brad Davies, Han Liu, Matthew Shotton & Chris Williams

* Main project idea agreed between team members.
* Roles & Responsibilities assigned to team members.
* Initial major project risks identified.
* Initial look at project aims & scope.
* Initial functional requirements of the project outlined.

---

## 14th February 2017

### In attendance
> Brad Davies, Han Lui & Chris Williams

* Created student questionnaire in conjunction with the ethical practices of the University and the proposed project aims.
* Roles & Responsibilities assigned to team members.

---

## 21st February 2017

### In attendance
> Brad Davies, Han Lui, Matthew Shotton & Chris Williams

* Student questionnaire revisited and adjusted to include recommended improvements.
* Stakeholder changed from demonstrator to a representative of students from 1st, 2nd and (potentially) 3rd year.
* Requirements further cemented and agreed upon, programming languages and tools agreed upon.
* Brief presentation given to the group

---

## 28th February 2017

### In attendance
> Han Lui, Matthew Shotton & Chris Williams

* Opened a Google account to be shared and accessed by the group
* Created a Google Form containing the now approved questionnaire to be distributed to students
* Discussed the flow of the website (UX) as a whole and how users will gain access each proposed section. Viewed other websites to gain inspiration and discuss ideas  
* Tentatively began an ER-D and menu map

---

## 7th March 2017

### In attendance
> Han Liu, Chris Williams & Brad Davies.

* Initial entity relationship diagram constructed, outlining the intended design of the system and the data it contains.
* Data dictionary for ERD created, documenting the fields and data types the associated entities will contain.
* Methodology of feature-driven development incorporated into our previous approach.
* Further consolidated our overall system and the functional and visual aspects.

---

## 14th March 2017

### In attendance
> Han Liu, Matthew Shotton, Brad Davies & Chris Williams

* Page layout and pages to include discussed by the group. Specifically what a user who is logged in or not registered should be able to see and do.
* After logging in a student should land at a content feed page showing recent activity based on their modules
* Starting designing page wireframes for the log in and sign in pages which all members will expand upon before the next group meeting.
* Decided on a build path using Vuejs for serving page views and components required for a single page application.

---

## 21st March 2017

### In attendance
> Han Liu, Brad Davies & Chris Williams

* ER-D altered to now 7 tables, removed the wiki table into the module table as the link between was one-to-one and the wiki field text changed to outline. 
* Primary keys for each table now prefixed with table name. 
* Created the relational database with all fields, types and size. The firebase database using share google account also established.
* Added additional details to part 1 of doc to reflect changes to the database. 
* Set-up the build path and updated the repo 

---

## 28th March 2017

### In attendance
> Han Liu, Matthew Shotton, Brad Davies & Chris Williams

* Began work on the back-end of the system, with a RESTful API setup to act and respond to requests sent via AJAX.
* 2 php pages created to perform most of the heavy lifting re-database. 
* ajax.php used for GET and POST requests made which utilises functions.php to perform the connection.
* Basic create new user now possible via temporary TestLogin vue component. User password hashed and userID randomised utilising helper function in functions.php
* User-critical data retrieval/addition/modification must only be performed if a valid user login session is sent with the request.

---

## 4th April 2017

### In attendance
> Han Liu, Brad Davies & Chris Williams

* Continued to develop the API via PHP that is required for interacting with the system & database.
* Further considered the security aspects of the system with relation to XSS/CSRF prevention via form sanitization, prepared statements via PDO and form request tokens.
* Persistent login system now functional and working correctly. Sessions will persist across a period of time (typically 2 weeks or 30 days), and automatically re-login the user on returning to the site.
* __Agreements made for team members to continue developing both the system and producing the relevant documentation throughout the Easter break. Will continue to communicate via Slack and Github, with relevant documentation being produced and accessible via OneDrive, and all system source code being managed through Git SCM and GitHub.__

---

## 25th April 2017

### In attendance
> Han Liu, Matthew Shotton, Brad Davies & Chris Williams

* Started work on the final must have requirement, Question & Answer section with a toggle included when users want to post a message anonymously
* Black box testing on the live website
* Design updated in various components: modules / search / app sidebar
