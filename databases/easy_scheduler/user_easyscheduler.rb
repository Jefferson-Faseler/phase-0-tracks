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


def create_user(username)
  $database.execute("INSERT INTO users (name) VALUES (?)", [username])
end

def find_username(username)
  user = $database.execute("SELECT name FROM USERS WHERE name = '#{username}'")
end

# def update_schedule(username)
#   schedule = {}
#   user_id = find_user_id(username).join
#   days = find_days(user_id)
#   days.each do |day|
#     day_id = find_day_id(day).join
#     times = find_times(user_id, day_id)
#     schedule[day] = times
#   end
# end

# def add_to_schedule(day, time, length, schedule, username)
#   if check_day(day)
#     schedule[day] ||= []
#     length.times do
#       if time_verification(username, day, time)
#         schedule[day].push(time)
#         add_to_db(day, time, username)
#         time += 1
#       else 
#         time += 1
#       end
#     end
#   else
#     puts "'#{day}' is not a valid day."
#   end
#   schedule
# end

# def delete_from_schedule(day, time, schedule, username)
#   if time_verification(username, day, time)
#     delete_from_db(day, time, username)
#     schedule[day].delete(time)
#   end
#   schedule
# end

def input_to_id(username, day)
  day_id = find_day_id(day)
  user_id = find_user_id(username)
  return day_id, user_id
end

def print_schedule(username)
  user_id = find_user_id(username).join
  print_days = find_days(user_id)
  puts "#{username}'s schedule for this week:"
  print_days.each do |day|
    puts "On #{day}"
    day_id = find_day_id(day).join
    print find_times(user_id, day_id)
  end
  puts ''
end

def check_day(day)
  days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
if days_of_week.include?(day)
  return true
end
end

# removes duplicate rows if user input duplicate data
def time_verification(user_id, day_id, time)
  $database.execute(<<-SCRIPT
    DELETE FROM schedules
    WHERE user_id = #{user_id}
    AND day_id = #{day_id}
    AND time = #{time}
    AND id <> ( SELECT MIN(id)
    FROM schedules
    GROUP BY time
    HAVING COUNT(*) > 1);
    SCRIPT
    )
end
      
def add_to_db(day, time, username)
user_id = find_user_id(username)
day_id = find_day_id(day)
$database.execute(
  "INSERT INTO schedules (user_id, day_id, time)
  VALUES (?,?,?)",
  [user_id, day_id, time])
time_verification(user_id, day_id, time)
end

def delete_from_db(day, time, username)
  $database.execute(<<-SCRIPT
    DELETE FROM schedules
    WHERE user_id = #{find_user_id(username)}
    AND day_id = #{find_day_id(day)}
    AND time = #{time}
    SCRIPT
    )
end

# returns SQL day_id
def find_day_id(day)
  $database.execute("SELECT id FROM days WHERE day = '#{day}'").flatten
end

# returns SQL user_id
def find_user_id(username)
  $database.execute("SELECT id FROM users WHERE name = '#{username}'").flatten
end

def find_days(user_id)
  $database.execute(<<-SCRIPT
  SELECT day
  FROM days
  WHERE id IN (
  SELECT day_id
  FROM schedules
  WHERE user_id=#{user_id}
  )
  SCRIPT
  ).flatten
end

def find_times(user_id, day_id)
  $database.execute(<<-SCRIPT
  SELECT time
  FROM schedules
  WHERE user_id=#{user_id}
  AND day_id = #{day_id}
  ORDER BY time
  SCRIPT
  ).flatten
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


