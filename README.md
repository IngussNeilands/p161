## README

Platform161 Twitter Solution.

Platform161 has decided to change its business model and is going to create
something new, a social network. From the app we want to provide these
features:
*   A user can register using his email, a selected password and a user name.
*   The user name has to be unique.
*   One user can publish messages no longer than 160 characters.

*   One user can follow what other users publish.
*   When the user accesses the application, he will see the messages published
    by the users he follow.

*   Everyone can see the users followed by any user.
*   Everyone can see the users that follow one user.


But other developers should be able to build their own applications using
these public information. So, provide an API access to allow:
*   See one user messages.
*   See the users followed by one user.
*   See the users that follow one user.


### General

*   RVM

*   Ruby version: 2.2.0

*   Rails version: 4.2.0


### System dependencies

none

### Configuration

### Database creation

Database is simple sqlite3.

'rake db:create'

### Database initialization

'rake db:migrate'

### How to run the test suite

'rake'

### Activity stream

"[Somebody you follow] [did] [something]" => An activity belongs to the user,
if the activity was created by a user he follows. One common activity stream
for each user.

user_id:User1 verb:followed subject: User2

User.followers = where(subject: self) User.following = activities.where(verb:
'followed').map(&:subject)

*   Services (job queues, cache servers, search engines, etc.)

*   Deployment instructions
