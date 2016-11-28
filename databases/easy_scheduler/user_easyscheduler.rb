# create user for people new to the program
# => Steps: pass in username as parameter
# => insert the new username into the database in users table
# output: return nothing if successful

# find the username of an existing user
# => Steps: pass in username as parameter
# => assign the output from database users table
# => to local method variable for readability
# output: return that local method variable

# print a user's schedule
# => Steps: pass in username as parameter
# => find user_id with method
# => find all the days that match user_id from schedules table
# => print out each day and each time for that day with interpolation
# => find each day_id with method
# output: print to screen

# check for proper user input for typed days
# => Steps: pass in user input as parameter
# => If day parameter is or is not in the array, return output
# output: return true or false

# verify that user input time is not already in the database
# => Steps: collect count of all times matching parameters
# => If the count is more than 1 go to method to remove duplicate times
# => Else move on
# output: return true or false for duplicate times

# remove duplicate times
# => Steps: remove all times matching parameters 
# => Except for the time with the biggest id
# output: return updated database

# add user input times to the database
# => Steps: Pass in user input as parameters
# => Find user_id to add to schedules table
# => add the input to the schedules table
# => Call time verification method
# output: updated database

# remove user input times from the database
# => Steps: Pass user input as parameters
# => Find user_id to remove from schedules table
# => delete all times matching parameters
# output: updated schedules table

# compare the days a user has with another user they wish to meet with
# => Steps: pass user input as parameters
# => find both user ids
# => compare both user ids to schedules table
# => if they have days that match go to next method for comparing times
# => if they do not have matching days print message
# output: move on to next method or print message

# compare and print matching user times
# => Steps: pass parameters from comparing days
# => find all time ids from schedules table
# => compare and keep all matching times
# outout: print all matching times as array

# find day id from days table
# => Steps: compare day parameter to days table
# output: return day_id

# find user id from users table
# => Steps: compare username parameter to users table
# output: return user_id

# find all days matching user_id
# => Steps: use subquery to compare user_id parameter to schedules table
# => return to query all matching day_ids and find the day names for each
# output: return all matching days by name from schedules table

# find all times belonging to a user in a day
# => Steps: compare user_id and day_id to schedules table
# output: return all matching times from schedules table

require 'sqlite3'
require_relative 'scheduler'

def create_user(username)
  $database.execute("INSERT INTO users (name) VALUES (?)", [username])
end

def find_username(username)
  $database.execute("SELECT name FROM USERS WHERE name = ?", [username])
end

def print_schedule(username)
  user_id = find_user_id(username)
  print_days = find_days(user_id)
  puts "#{username}'s schedule for this week:"
  print_days.each do |day|
    puts "On #{day}"
    day_id = find_day_id(day)
    print find_times(user_id, day_id)
    print "\n"
  end
end

def check_day(day)
  days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
if days_of_week.include?(day)
  return true
end
end

# removes duplicate rows if user input duplicate data
def time_verification(user_id, day_id, time)
  count = $database.execute("
    SELECT COUNT(*)
    FROM schedules
    WHERE user_id = ?
    AND day_id = ?
    AND time = ?
    AND id <> ( SELECT MIN(id)
    FROM schedules
    GROUP BY time
    HAVING COUNT(*) > 1);
    ", [user_id, day_id, time]).flatten.join.to_i
  if count >= 2 
    remove_duplicates(user_id, day_id, time)
  end
end

def remove_duplicates(user_id, day_id, time)
  $database.execute("
  DELETE FROM schedules
  WHERE user_id = ?
  AND day_id = ?
  AND time = ?
  AND id IN ( SELECT MAX(id)
  FROM schedules
  GROUP BY time
  HAVING COUNT(*) > 1);
  ", [user_id, day_id, time])
end
      
def add_to_db(day_id, time, username)
  user_id = find_user_id(username)
  $database.execute("INSERT INTO schedules (user_id, day_id, time)
    VALUES (?,?,?)", [user_id, day_id, time])
  time_verification(user_id, day_id, time)
end

def delete_from_db(day, time, username)
  user_id = find_user_id(username)
  day_id = find_day_id(day)
  $database.execute("
    DELETE FROM schedules
    WHERE user_id = ?
    AND day_id = ?
    AND time = ?", [user_id, day_id, time])
end

def compare_user_days(username, second_user)
  user_id = find_user_id(username).to_i
  second_user_id = find_user_id(second_user).to_i
  matching_times = $database.execute(" 
    SELECT COUNT(*)
    FROM schedules
    WHERE user_id = ?
    OR user_id = ?", [user_id, second_user_id]).flatten.join.to_i
  if matching_times >= 1
    compare_and_print_user_times(user_id, second_user_id)
  else
    puts "Sorry, it looks like your schedules don't line up this week."
  end
end

def compare_and_print_user_times(user_id, second_user_id)
  matching_day_ids = $database.execute("
    SELECT DISTINCT day_id 
    FROM schedules 
    WHERE user_id = ?
    OR user_id = ?", [user_id, second_user_id]).flatten
  matching_day_ids.each do |day|
    user_times = find_times(user_id, day)
    second_user_times = find_times(second_user_id, day)
    puts "You can meet on:"
    puts $database.execute("SELECT day FROM days WHERE id = ?", [day])
    print "At: "
    print user_times & second_user_times
    print "\n"
  end
end

# returns SQL day_id
def find_day_id(day)
  $database.execute("SELECT id FROM days WHERE day = ?", [day]).flatten.join
end

# returns SQL user_id
def find_user_id(username)
  $database.execute("SELECT id FROM users WHERE name = ?", [username]).flatten.join
end

def find_days(user_id)
  $database.execute("
  SELECT day
  FROM days
  WHERE id IN (
  SELECT day_id
  FROM schedules
  WHERE user_id= ?
  )", [user_id]).flatten
end

def find_times(user_id, day_id)
  $database.execute("
  SELECT time
  FROM schedules
  WHERE user_id= ?
  AND day_id = ?
  ORDER BY time", [user_id, day_id]).flatten
end

# def input_to_id(username, day)
#   day_id = find_day_id(day)
#   user_id = find_user_id(username)
#   return day_id, user_id
# end