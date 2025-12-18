# Install Rails
# google that s**t

# new rails project with postgres and a couple optional features omitted
# note: needs admin, git bash isn't going to fly here
rails new example -A -J -T -d postgresql
# -J skips Javascript, -T skips tests, I forget -A

# boot docker engine
docker compose up
# run in directory with docker-compose.yml

# set database variables via basic/example/config/database.yml
# was somewhat challenging

# run the following to verify that all the gems were correctly installed in the basic/example folder
bundle install

# start the rails project
```sh
bundle exec rails s -b 0.0.0.0
```
# start doesn't work but s does, idk why, gives argument issues

# create migration?
```sh
rails generate migration create_tables
```
# adjust example/db/migrate/<dthere>_create_tables.rb to contain example data
# make thing.rb in example/app/models

# Create DB
```sh
bundle exec rails db:create
```

# actually migrate db
```sh
bundle exec rails db:migrate
```

# verify table insertion with
```sh
rails c
```
```sh
Thing.all
```
# use q to leave list if in the middle of a huge output
# exit or quit work to leave the ruby console

# start app again, go to localhost:3000 should have your first ruby app up and running
# bundle exec rails s -b 0.0.0.0 ---- if you forgot

# use example/config/routes.rb to change which page we're loading as home by changing root

# update example/app/controllers/application_controller.rb

# create new folder "application" inside app/views
# create new file "home.html.erb" inside app/views/application

# Can setup/install the EB CLI
# Sent me to this github repo:
# https://github.com/aws/aws-elastic-beanstalk-cli-setup
# needed powershell/cmd to install. bit finnicky

# package for EB 
# zip the contents, not the directory, upload to Elastic Beanstalk