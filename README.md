# README

Thanks for looking this over :)
If you don't have ruby set up, please follow the steps in the last section first.

### To Run
1. Install dependencies
```
bundle
```
2. Create and migrate database
```
rake db:setup
```
3. Seed database
```
rake db:seed
```
4. Run server locally
```
rails s
```

---

### To Test
1. Seed test database
```
rake db:seed RAILS_ENV=test
```

2. Run test suite
```
rspec
```
3. Run linter/ static code analyzer
```
rubocop
```

---

### Some info and criticisms
#### Populating the database
- I populated db with songs from the Spotify API -> I used the rake task `lib/tasks/db.rake` to populate my local database `rake db:import_from_spotify` and then dynamically generate the seed file `rake db:seed:dump`
- I used a rake task instead of doing the import directly in the seed file for two reasons:
1) Eliminates dependency on the Spotify API for app functionality
2) The API authenticates all endpoints now and I did not want to check in my secret keys into source control

#### Song and SongsController
- I did not create separate models for Album and Artist because it did not make sense for the scope of this project
- For the same reason, I also did not create a separate controller for the Search

### SongSearch
- Service class that only has class methods and holds no state
- Con -> the search is very basic -> ideally more relevant results should show up first

#### Tests
- Con -> I should not have seeded the test database with production data because it slows down the test and couples tests to the Spotify API data/ specific data in the seed file. Normally I would have used factories

---

### Setting up ruby environment (Skip This Section if you already have Ruby set up on your machine)

1. Homebrew - ruby package manager
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
2. Ruby
```
brew install ruby
```
3. Make sure ruby is in your path
In `~/.bash_profile`
```
export PATH=/usr/local/Cellar/ruby/2.4.2/bin:$PATH

source ~/.bash_profile
```
4. Gem to manage gem dependencies
```
gem install bundler
```
5. Install Postgres
```
brew install postgres
echo "export PGDATA='/usr/local/var/postgres'" >> ~/.bash_profile
source ~/.bash_profile
bundle exec rake db:create
bundle exec rake db:migrate
```
6. Run Postgres
```
pg_ctl start
```

##### Resources
- https://www.ruby-lang.org/en/documentation/installation/
- https://brew.sh/
- https://stackoverflow.com/questions/12287882/installing-ruby-with-homebrew
- http://bundler.io/

---
