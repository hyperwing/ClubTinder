# Project 6
### Ruby on Rails Project
The team created the Web App Hubbub. Hubbub is an application that matches students to clubs they are most compatible with based on their interests and using other user data. Students can sign up and log into the application. In addition, there is also admin acess and club access to the application. If at any point the user forgets their password they can reset it.

#### Student Access includes the following:
- Swipe Page: Displays club options that the user might like and gives the user the option to match with these clubs
- Display matches: Allows the user to see all the clubs they chose to match with. User can also change their matches after selection.
- Interests page: User can change their interests 
- Explore page: User can search for any club

#### Admin Access includes the following:
- Can view all the clubs in the database and have acess to modify their info
- Can view all the users in the database and have access to modify their info
- Can create dummy user accounts 
- Can view user stats

#### Club access includes the following:
- Edit their data 
- See user stats

### Roles
* Overall Project Manager:Neel Mansukhani
* Coding Manager: David Wing
* Testing Manager: Sri Ramya Dandu
* Documentation Manager: Sharon Qiu

### Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

Sri Ramya Dandu
1. Set up user and email configurations using Devise Framework
2. Views and controller code for the 7 CRUD operations for admins
3. Stats display views and controller for Admins

Leah Gillespie
1. Set up filtering on interests on the explore page (model, controller, and view work)
2. Set up the view and bootstrap carousel for the swipe page, and adjusted matched results for the user (model, view, controller)
3. Created club_interests model, added parsed data in seed
4. Added parsed data to clubs model in seed

Neel Mansukahi 

Sharon Qiu
1. Set up the Matched and Not Matched routes as well as the controller and model for club matches.

David Wing

### Running the program
To run the program, follow these steps:
1. Change directory to the hubbub folder using cd hubbub
2. Migrate the models by typing into console/terminal: "rails db:migrate"
3. Fill models by typing into console/terminal: "rails db:seed"
4. Start the server by typing into console/terminal: "rails s"
5. To access various views:
    * User
        1. Around 50 users have been initialized in the seed. To access a regular user, the email initialized is user#@gmail.com where # is a value between 1 and 49. The password is 111111.
    * Admin
        1. Log in by using one of the group member's emails. This include:
            * mansukhani.9@osu.edu
            * wing.49@osu.edu
            * gillespie.267@osu.edu
            * dandu.7@osu.edu
            * Qiu.374@osu.edu
        2. Enter the password. It should be 111111.
    * Club
### Running the tests
To run tests, follow these steps:
1. Change directory to the hubbub folder using cd hubbub
2. in your console/terminal, type in: "rails test"