# An application that compares windows of time and openings so that 
# people can find ways to meet together. 
# If I have Tuesday morning, wed afternoon and wed night open and that is it 
# And Steve has Monday morning, Wed night, and Friday morning open 
# We can cross reference the times with the program 
# and it will tell us when we have openings

# to get more ambitous if you have more than one time 
# slot that overlap it will tell you how long of a time slot each is.

# user enters their name and then a day of the week
# and any time block they are free




require 'sqlite3'
require 'faker'

database = SQLite3::Database.new('schedules.db')

# user table command
create_user_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    name VARCHAR(50)
  )
SCRIPT

# time table command
create_time_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS times(
    id INTEGER PRIMARY KEY,
    time VARCAHR(15)
  )
SCRIPT

# day table command
create_day_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS days(
    id INTEGER PRIMARY KEY,
    day VARCHAR(15)
  )
SCRIPT

# time to schedule joiner
create_time_schedule_joiner = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS times_schedules(
  )

# schedule table command
create_schedule_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS schedules(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    opening INTEGER,
    time INTEGER,
  )
SCRIPT

# create table
database.execute(create_schedule_table)

# test users
database.execute("INSERT INTO schedules")