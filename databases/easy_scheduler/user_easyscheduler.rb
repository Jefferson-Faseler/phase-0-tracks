# Allow each user to have their own schedule viewable by them 
# and accessible for comparison to another user's schedule
  # create user class with intialized hash empty 
  # (later to be filled with each hour that is free)
    # steps: create user class with initialize method that takes name as parameter
    # set two instance variables name and schedule
  # output: returns empty schedule

# Allow each user to add times to their schedule
  # insert nested key value pairs for day and time into hash
    # create empty array for day when passed as an argument
      # use ||= operator so that the day is not overwritten
    # when user enters day it creates key, with nested array for value
    # array elements are hour blocks the user is free
  # output: return updated hash

# Allow user to remove a date from their schedule
  # use #delete on day the user would like to remove
  # output: return updated schedule

# Allow user to print their schedule
  # use interpolation and iteration to display days and times
  # output: to screen and return schedule

# Do not allow user to enter duplicate times in day
  # run uniq! each time user adds time to hash
  # output: return unique hash

require 'sqlite3'
require_relative 'scheduler'
  
schedule = {}

def create_user(database, username)
  database.execute("INSERT INTO users (name) VALUES (?)", [username])
end

def add_to_schedule(day, time, length, database)
  if check_day(day)
    schedule[day] ||= []
    length.times do
      if time_verification(day, time)
        schedule[day].push(time)
        add_to_db(database, day, time)
        time += 1
      else 
        time += 1
      end
    end
  else
    puts "'#{day}' is not a valid day."
  end
  schedule
end

def delete_from_schedule(database, day, time)
  if time_verification(time)
    delete_from_db(database, day, time)
    schedule[day].delete(time)
  end
  schedule
end

def print_schedule
  puts 'Your entire schedule for this week:'
schedule.each_key do |day|
    puts "On #{day} you are free at these times:"
    schedule[day].each {|time| puts "#{time}"}
  end
end

def check_day(day)
  days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
if days_of_week.include?(day)
  return true
end
end

def time_verification(day, time)
  if !schedule[day].include?(time)
    return true
  elsif schedule[day].include?(time)
    return false
  else
    return nil
  end
end
      
def add_to_db(database, day, time)
user_id = find_user_id(database)
day_id = find_day_id(database, day)
database.execute(
  "INSERT INTO schedules (user_id, day_id, time)
  VALUES (?,?,?)",
  [user_id, day_id, time])
end

def delete_from_db(database, day, time)
  database.execute(
    "DELETE FROM schedules
    WHERE user_id = #{find_user_id}
    AND day_id = #{find_day_id(day)}
    AND time = #{time}"
    )
end

def find_day_id(database, day)
  database.execute("SELECT id FROM days WHERE day = '#{day}'")
end

def find_user_id(database, username)
  database.execute("SELECT id FROM users WHERE name = '#{username}'")
end



# ## DRIVER CODE ##
# temp = User.new('John Smith')
# # => <User:0x007f977d011d98 @name="John Smith", @schedule={}>
# temp.add_to_schedule('Monday', 6,4)
# # => {"Monday"=>[6, 7, 8, 9]}
# temp.add_to_schedule('Tuesday',7,3)
# # => {"Monday"=>[6, 7, 8, 9], "Tuesday"=>[7, 8, 9]}
# temp.print_schedule
#   # Your entire schedule for this week:
#   # On Monday you are free at these times:
#   # 6
#   # 7
#   # 8
#   # 9
#   # On Tuesday you are free at these times:
#   # 7
#   # 8
#   # 9
# temp.add_to_schedule('Monday',7,4)
# # => {"Monday"=>[6, 7, 8, 9, 10]}
# temp.add_to_schedule('Mon',6,4)
# # => "'Mon' is not a valid day."


