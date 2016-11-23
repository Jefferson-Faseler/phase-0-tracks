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

# day table command
create_day_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS days(
    id INTEGER PRIMARY KEY,
    day VARCHAR(15)
  )
SCRIPT

# time table command
create_time_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS times(
    id INTEGER PRIMARY KEY,
    time VARCAHR(15)
  )
SCRIPT

# schedule table command
# acts as joiner
create_schedule_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS schedules(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    day_id INTEGER,
    time_id INTEGER,
    FOREIGN KEY user_id REFERENCES users(id),
    FOREIGN KEY day_id REFERENCES days(id),
    FOREIGN KEY time_id REFERENCES times(id)
  )
SCRIPT

# create table
database.execute(create_user_table)
database.execute(create_day_table)
database.execute(create_time_table)
database.execute(create_schedule_table)

# create test users
def create_users (db, name)
  db.execute("INSERT INTO users (name) VALUES (?)", [name])
end

100.times do
  create_users(database, FAKER::Name.name)
end





















