# README

### Ruby version and notes

* Wistia fullstack code challenge, developed by Aaron Poncé using Ruby '2.4.1', Rails '5.0.3'and 'Postgresql'. Please review the gem file dependencies and run `bundle` to build the project. For testing I've chosen Rspec which can be executed by running  ``bundle exec rspec spec``.

### App dependencies

* Run the app locally by opening terminal and creating a new project directory.

* `mkdir wistiaTest`
* `cd wistiaTest`
* `git clone git@github.com:amponce/fullstack-wistia.git`

### Database creation

* In the terminal, navigate to the application's directory and perform a migration to set up the database.
* Make sure you have Postgres running:

* $ `rake db:migrate`
* Current database name is ``fullstack-wistia_test``

* Review gem dependencies
$  `bundle`
$  `rails s`
* View app: [localhost:3000](http://localhost:3000/)

### Run Tests

Rspec and Coverage: $ ``bundle exec rspec spec``

### Deployment instructions

##### The app is currently hosted [here](https://blooming-wildwood-69662.herokuapp.com/).

* `brew install heroku`
* `heroku create`
* `git config --list | grep heroku`
* `push heroku master`
* `heroku run rake db:migrate`
* `heroku ps:scale web=1`
* `heroku open`

##### Need more info? Follow the steps [here](https://devcenter.heroku.com/articles/getting-started-with-rails5).

###  How the project went

This app was both challenging and rewarding for me. I haven't built anything using Ruby on Rails before so I pretty much had to start from square one. I learned how to set up my environment, execute rails commands, bundle gems and add models, controllers, and views. I am familiar with Python/Django and since it has a similar MVC structure and route system, it helped to have something to relate to. After going through this process, I am confident in using Ruby on Rails for future projects.

### Design decisions

I decided to add pagination to the app to be able to support scaling for unlimited file imports. This also helped keep the UI clean by only showing a certain number of fields in the view.

### Lessons learned

Learning a new framework always takes a lot of time and research, so I knew I would have to budget my time this week accordingly.

When I was setting up my environment, I ran into a problem setting up rails because of an error related to zlib. After browsing through stackoverflow, I found a simple solution that involved deleting zlib from homebrew and reinstalling it entirely because it was a bad version. After that, things finally came together.

Originally I started down a different path by trying to import only CSV files. However, after reviewing the comp more closely, I realized that limiting the files to a specific format was not the ideal route for me to go with this. The example files provided to me were in .txt format so I decided to broaden the support for file formats with ActiveRecord import. Now the app supports multiple formats (e.g. .txt .csv and .excel).

A big challenge for me was learning to use various types of ActiveRecord migrations for this project. I initially created my model with the :string type for each column, I planned on formating the date with JavaScript which backfired because it only worked in Chrome. I decided to try to format the date using `bin/rails generate migration ChangeDefaultBirthday birthday:datetime` at the server level, which failed because I didn't drop the `:people, :birthday` column before I tried to change the string to a datetime. I ended up blowing away my schema and rolling back to the JavaScript version that I previously had. If I had more time, I would spend it researching how `:datetime` is handled on the server side, rather than trying to fromat the string with JavaScript.

### For next time

There are few outstanding items that I would have liked to address:

* Birthday field needs to be revamped as a datetime so I can format the dates correctly
* Resolve mobile issues, it's currently best viewed at desktop (currently there is a date-related display issue on iOS)
* Add error message to indicate when a user has uploaded a duplicate file
* Add test to upload a duplicate file and expect an error message
* Add error message to indicate an invalid file
* Add test for invalid file that expects the designated error message
* Add a close button to the user import message
* Cross browser testing
* Accessibility support
