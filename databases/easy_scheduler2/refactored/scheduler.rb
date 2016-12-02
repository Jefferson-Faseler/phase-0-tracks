require 'sqlite3'

$database = SQLite3::Database.new('easy_scheduler.db')

create_user_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
  )
SCRIPT

create_day_table = <<-SCRIPT
  CREATE TABLE IF NOT EXISTS days(
    id INTEGER PRIMARY KEY,
    day VARCHAR(15)
  )
SCRIPT

# joiner table
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

$database.execute(create_user_table)
$database.execute(create_day_table)
$database.execute(create_schedule_table)

# def add_day_values
#   days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
#   days_of_week.each do |day|
#     $database.execute("INSERT INTO days (day) VALUES (?)", [day])
#   end
# end

# add_day_values