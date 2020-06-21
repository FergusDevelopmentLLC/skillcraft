# SkillCraft

SkillCraft is a demonstration Ruby/Rails online classroom manager. Google Classroom meets ClassDojo.

## Installation

You must have a local Postgres development database server running. 

Create an empty database on your server called 'skillcraft'.

Update config/database.yml with your database credentials, something like this:

```
development:
  adapter: postgresql
  encoding: unicode
  database: skillcraft
  pool: 2
  username: XXX
  password: XXX
  host: localhost
  port: 5432
```

Clone this repository.

Run:

```
$ cd skillcraft
$ bundle install
$ rake db:migrate 
$ rake db:seed 
$ rails s
```

There will multiple students and teachers in the system after seeding with the following credentials. Logging in not required to see the app in action.

Sample student login:
```
username: BillyStudent
password: password
```

Sample teacher login:
```
username: LarryTeacher
password: password
```

## Live demo

http://skillcraft.herokuapp.com/

## Contributing Bugfixes or Features

* Fork the this repository
* Create a local development branch for the bugfix; I recommend naming the branch such that you'll recognize its purpose.
* Commit a change, and push your local branch to your github fork
* Send me pull request for your changes to be included

## License

SkillCraft is licensed under the MIT license. (http://opensource.org/licenses/MIT)