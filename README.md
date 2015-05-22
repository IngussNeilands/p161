# README #

Platform161 Twitter Solution.

Platform161 has decided to change its business model and is going to create something new, a social network.
From the app we want to provide these features:

* A user can register using his email, a selected password and a user name. The user name has to be unique.

* One user can publish messages no longer than 160 characters.

* One user can follow what other users publish.

* When the user accesses the application, he will see the messages published by the users he follow.

* Everyone can see the users followed by any user.

* Everyone can see the users that follow one user.

But other developers should be able to build their own applications using these public information. So, provide an API access to allow:

* See one user messages.

* See the users followed by one user.

* See the users that follow one user.

## General ##

* Ruby version: 2.2.0

* Rails version: 4.2.0

### System dependencies ###


### Configuration ###

### Database creation ###

Database is simple sqlite3.

'rake db:create'

### Database initialization ###

'rake db:migrate'

### How to run the test suite ###

'rake'

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

### Sessions and User login ###

Sessions are handled with session variable session[:user_id]
User login is via username and password.

Every controller that needs an authenticated user can be inherited from SecuredController:

```
class SecuredController < ApplicationController
	before_action :authenticate_user

	private

	def authenticate_user
		...
	end
end
```

WARNING: Since SessionsController is set to assign resources, logout needs an id. That id is set to be the userid. !!!!

## API ##

Always returns json.

/api/v1/users/id/messages[.json]

'id'  is a valid user id
returns: user messages

example: http://localhost:3000/api/v1/users/980190964/messages[.json]
returns:

```
[
	{
		"owner_id":980190964,
		"id":980190967,
		"body":"Cool",
		"created_at":"2015-05-21T00:18:58.090Z"
	},
	{
		"owner_id":980190964,
		"id":980190968,
		"body":"Nice",
		"created_at":"2015-05-21T00:21:04.766Z"
	}
]
```

/api/v1/users/id/followers[.json]
'id'  is a valid user id
returns: user follwers

example: http://localhost:3000/api/v1/users/980190964/followers[.json]
returns:

```
[
	{
		"id":980190962,
		"username":"test",
		"email":"test@test.com"
	}
]
```
/api/v1/users/id/following[.json]
'id'  is a valid user id
returns: followed users

example: http://localhost:3000/api/v1/users/980190964/following[.json]
returns:

```
[
	{
		"id":298486374,
		"username":"example",
		"email":"example@example.com"
	},
	{
		"id":980190962,
		"username":
		"test",
		"email":"test@test.com"
	}
]
```
