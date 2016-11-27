# Create an application that cross references users free openings in a week
# With another user they are trying to meet
  # user enters their name and then a day of the week
  # and any time block they are free
  # application returns all matching free times for the two users

# Application setup and testing 
# Create a way to store information for users and their schedules
# Create database for three tables. 1. users 2. schedules(joiner) 3. days
# Steps: create ruby script that runs sqlite script to create database
# Use same scripting method to create three tables

# schedule table
# primary keys, user_id the schedule belongs to, day_id, time in 24hr format
    # fifth column for length of time block
    # develop mathematical formula for length of time causing overlap
      # ie: Wed 12:00 for 3 hours would overlap with Wed 13:00 for 2 hours


# add test data with ruby methods
  # create method to create users with Faker gem
  # create method for populating the schedules table with random data
  # within proper ranges

## ALGORITHM ##
# Compare the schedules of two users
# input: user's name and name of desired person to meet
# Steps: For each opening in the user's schedule
  # Compare with each other opening in desired person's schedule
  # Compare as hashes using .each_pair
    # if a key/value matches another there is a positive
    # else there is no matching free time slots



require 'sqlite3'
require_relative 'user_easyscheduler'

database = SQLite3::Database.new('easy_scheduler.db')
# database.results_as_hash = true

# user table command
create_user_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
  )
SCRIPT

# day table command
create_day_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS days(
    id INTEGER PRIMARY KEY,
    day VARCHAR(15)
  )
SCRIPT


# schedule table command
# acts as joiner
create_schedule_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS schedules(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    day_id INTEGER NOT NULL,
    time INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (day_id) REFERENCES days(id)
  )
SCRIPT

# create table
database.execute(create_user_table)
database.execute(create_day_table)
database.execute(create_schedule_table)

# def add_day_values(db)
#   days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
#   days_of_week.each do |day|
#     db.execute("INSERT INTO days (day) VALUES (?)", [day])
#   end
# end

# creates test users
def create_users(db, name)
  db.execute("INSERT INTO users (name) VALUES (?)", [name])
end

10.times do
  create_users(database, Faker::Name.name)
end

500.times do
  user = rand(1..10)
  day = rand(1..7)
  time = rand(0..23)
  add_to_db(day, time, user)
end