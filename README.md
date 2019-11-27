# Project 6
### Ruby on Rails Project
The team created the Web App Hubbub. Hubbub is an application that matches students to clubs they are most compatible with based on their interests and using other user data. Students can sign up and log into the application. In addition, there is also admin access and club access to the application. The functionality available to each user role is elaborated below.

#### General Access for users not logged in:
- Home info page: General overview of the app
- Explore page: Browse or search for clubs  
- Club info page: Club details
- Login/Sign-up
- Forgot Password: Receive an email to reset your password 

#### Student Access includes the following:
- Profile: Displays user info and matched info 
- Match Me Page: Displays club options that the user might like and gives the user the option to match with these clubs
- Display matches: Allows the user to see all the clubs they chose to match with. Users have the option to unmatch.
- Display rejections: Allows the user to see all the clubs they rejected. Users have the option to match.
- Interests page: User can change their interests 
- Explore page: User can search for any club and visit their page
- Settings: Users can edit their profiles or delete their account 
- Club Info Pages: Users can access info about clubs and have the choice to match them 

#### Admin Access includes the following:
- Have all user functionality 
- Can view all the clubs in the database and have access to modify their info
- Can view all the users in the database and have access to modify their info
- Can see stats for clubs
- Can see stats for users
- Can view user details about interests and matches without modifying 
- Can create dummy user accounts 

#### Club access includes the following:
- Edit their interests
- See their users
- See various statistics and graphs regarding their users.
- View their club profile page 

### Organization and Structure
All the folders detailing the application are within the hubbub folder:

1. App folder: Code is primarily written in this folder:
   * Assets folder contains the stylesheets for the web app
      - There are 3 primary style sheets: User, Club, and Admin (One for each role)

   * Controllers folder contains all the controller code for the application
      - controllers/users contains the devise controllers that the team specifically modified 
      - Contains controller files for each model and overall application

   * Models folder contains all the models for the web app and the association details

   * Views folder contains all the html erb files for the application
      - views/devise contains the view provided by devise that were modified by the team
      - views/layouts contains the partials applied to all pages
      - contains folders named after each model that contain views related to that model

2. Config folder details the routes, database, and initializations of configurations

3. db folder contains all the migrations and data for the seed

4. Test folder contains tests written for the web app
   * Controller folder contains tests reflecting routes 
   * Fixture folder specifies data for each model that can be used in various tests
   * Model folder contains tests reflecting the model and validations 

### Frameworks Used
1. Devise
2. Bootstrap 
3. Ajax
4. Chartkick
5. Groupdate
6. Disqus 
7. Minitest



### Team
Team Name: Error 403: Sleep Forbidden
Members:
1. Sri Ramya Dandu
2. Leah Gillespie
3. Neel Mansukahni 
4. Sharon Qiu
5. David Wing 

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
1. Controller code for adding matches/rejections from swipe page
2. Set up the view and bootstrap carousel for the swipe page, and adjusted matched results for the user (model, view, controller)
3. Routing for swipe page, club matches
4. Created club_interests model, added parsed data in seed
5. Added parsed data to clubs model in seed
6. Work on navbar css.
7. Tests

Neel Mansukahni 
1. Set up admin and club privileges for users model.
2. Created collaborative filtering algorithm for the matches display order(controller).
3. Created and routed all club role related pages (including controllers)
4. Created home page
5. Created most model associations.
6. Tests

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


### Running the program
To run the program, follow these steps:
1. Change directory to the hubbub folder using "cd hubbub"
2. Run "bundle install"
3. Migrate the models by typing into console/terminal: "rails db:migrate"
4. Fill models by typing into console/terminal: "rails db:seed". Note: this will take a while
5. Start the server by typing into console/terminal: "rails s"
6. To access various views with predefined accounts:
    * User
        1. Around 50 users have been initialized in the seed. To access a regular user, the email initialized is user#@gmail.com where # is a value between 1 and 49. The password is 111111.
    * Admin
        1. Log in by using one of the group member's emails. This include:
            * mansukhani.9@osu.edu
            * wing.49@osu.edu
            * gillespie.267@osu.edu
            * dandu.7@osu.edu
            * qiu.374@osu.edu
        2. Enter the password. It should be 111111.
    * Club
        1. Login as club.1@osu.edu, the password should be 111111.
        
### Testing

#### Testing Models 
1. Via Rails Console to populate and observe models
2. Create Users in fixtures and wrote tests in test/models directory
3. Database Testing: Observing how data is being changed and models are being populated as a result of user input

#### Testing Routes 
1. Whitebox Testing via localhost
2. Controller Testing in tests/controllers

#### Integration Testing
1. Blackbox Testing via localhost
2. Controller Testing in tests/controllers

### Running the tests
To run tests, follow these steps:
1. Change directory to the hubbub folder using "cd hubbub" if you haven't done so already.
2. You may need to enter the following in terminal: "rails db:migrate RAILS_ENV=test". 
3. In your console/terminal, type in: "rails test"

### Testing contributions
All team members tested via localhost to ensure that routing worked and that user interactions were being reflected within the view.

Sharon Qiu:
1. White box testing for add_current_club_match route (to see if it switches from matched to unmatched pages)
2. Model tests for club_match model

Sri Ramya Dandu:
1. Model tests for User model validations 
2. Controller tests for user vs. admin. vs. club routes
3. Blackbox integration testing for admin CRUD operations

Neel Mansukhani:
1. Model tests for Interest and ClubInterest.
2. Whitebox testing of match me page algorithm and club interests controller.
3. Whitebox testing of user and club sign up process

David Wing
1. Blackbox integration testing for user preferences
2. Whitebox testing to ensure user profiles are required for user/club select interest prefences
3. Whitebox testing for path redirects
4. Blackbox intergration testing for charts and graphs in User stats page
5. Blackbox intergration testing for charts and graphs in Club stats page

Leah Gillespie
1. Model tests for UserInterest, Club
2. Whitebox testing for swipe functionality, including additions to ClubMatches database
3. Whitebox routing tests using local_host
