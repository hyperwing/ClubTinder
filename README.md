# Project 6
### Ruby on Rails Project
The team created the Web App Hubbub. Hubbub is an application that matches students to clubs they are most compatible with based on their interests and using other user data. Students can sign up and log into the application. In addition, there is also admin access and club access to the application. The functionality available to each user role is elaborated below.

#### Student Access includes the following:
- Profile: Displays user info and matched info 
- Match Me Page: Displays club options that the user might like and gives the user the option to match with these clubs
- Display matches: Allows the user to see all the clubs they chose to match with. Users have the option to unmatch.
- Display rejections: Allows the user to see all the clubs they rejected. Users have the option to match.
- Interests page: User can change their interests 
- Explore page: User can search for any club or browse the clubs by name/interests
- Settings: Users can edit their profiles or delete their account 
- Club Info Pages: Users can access info about clubs 

#### Admin Access includes the following:
- Have all user functionality 
- Can view all the clubs in the database and have acess to modify their info
- Can view all the users in the database and have access to modify their info
- Can see stats for clubs
- Can see stats for users
- Can view user details aboute interests and matches without modifying 
- Can create dummy user accounts 
- Can view user stats

#### Club access includes the following:
- Edit their interests
- See their users
- See various statistics and graphs regarding their users.

### Roles
* Overall Project Manager: Neel Mansukhani
* Coding Manager: David Wing
* Testing Manager: Sri Ramya Dandu
* Documentation Manager: Sharon Qiu

### Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

All members collaborated to help each other on views and various tasks that needed to be completed.

Sri Ramya Dandu
1. Set up user and email configurations using Devise Framework
2. Populated interests model in the seed 
3. Views and controller code for the 7 CRUD operations for admins
4. Controller for stats and admin functionality 
5. Explore page view and admin stats views
6. Tests

Leah Gillespie
1. Set up filtering on interests on the explore page (model, controller, and view work)
2. Set up the view and bootstrap carousel for the swipe page, and adjusted matched results for the user (model, view, controller)
3. Created club_interests model, added parsed data in seed
4. Added parsed data to clubs model in seed

Neel Mansukahi 
1. Set up admin and club privileges for users model.
2. Created collaborative filtering algorithm for the matches display order.
3. Created and routed all club role related pages (including controllers)
4. Created home page
5. Created most model associations.

Sharon Qiu
1. Set up the Matched and Not Matched routes as well as the controller and model for club matches.
2. Parsed club data from OSU clubs page
3. Worked on views for forms
4. Search functionality and controller 
5. Tests
6. Club profile views

David Wing
1. Implemented user_interest table
2. Implemented stat graphs for clubs and users
3. routing for profile editing
4. Controller code for user_interests handling
5. Controller code for club_interests handling
6. Controller/model tests

### Frameworks Used
1. Devise
2. Bootstrap 
3. Ajax
4. Chartkick
5. Groupdate
6. Disqus 


### Running the program
To run the program, follow these steps:
1. Change directory to the hubbub folder using cd hubbub
2. Run "bundle install"
3. Migrate the models by typing into console/terminal: "rails db:migrate"
4. Fill models by typing into console/terminal: "rails db:seed". Note: this will take a while
5. Start the server by typing into console/terminal: "rails s"
6. To access various views:
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
        1. Login as club.1@osu.edu, the password should be 111111.
### Running the tests
To run tests, follow these steps:
1. Change directory to the hubbub folder using cd hubbub
2. in your console/terminal, type in: "rails test"
