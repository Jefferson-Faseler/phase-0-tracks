# Add method to enter new user information to database
  # method will take user input for name and add it to database through
  # function calls
# output: return new user name

# Add method for taking user input to assign to the database
  # use until loop to take user input until the user is finished
  # use function calls to ass input to database
# output: return new scheduled time



require_relative 'scheduler'
require_relative 'user_easyscheduler'
require 'sqlite3'
require 'faker'

database = SQLite3::Database.new('easy_scheduler.db')
database.results_as_hash = true

def new_user(database)
  puts 'Welcome to easy scheduler'
  puts 'Please enter a unique username:'
  username = gets.chomp
  new_user = User.new(username)
  new_user.create_user(database)
  return new_user.name
end

def find_username(username, database)
  database.execute("SELECT name FROM USERS WHERE name = '#{username}'")
end

def existing_user(database)
  puts 'Enter your username'
  user = gets.chomp
  puts find_username(user, database)
  return user = find_username(user, database).to_s
end

def schedule_times(username, database)
  confirm = nil
  until confirm == 'yes' || confirm == 'EXIT'
    puts "Enter the day you would like to add to your schedule or enter 'EXIT' to quit"
    puts "(Days are case sensitive and cannot be abbreviated)"
    day = gets.chomp
    puts "Now enter the hour in 24 clock format"
    time = gets.chomp.to_i
    puts "How long will you be free during this block?"
    length = gets.chomp.to_i
    puts "The day you entered is: #{day}"
    puts "The time you entered is: #{time}"
    puts "And you said you would be for: #{length} hours"
    puts "Is this information correct?"
    confirm = gets.chomp
  end
  if confirm == 'yes'
  username.add_to_schedule(day, time, length, database)
  username.print_schedule
  end
  return username
end

def unschedule_times(username, database)
  confirm = nil
  until confirm == 'yes' || confirm == 'EXIT'
    puts 'Enter the day you would like to remove the time from.'
    day = gets.chomp
    puts 'Enter the hour you would like to remove.'
    time = gets.chomp
    puts "The day you entered is: #{day}"
    puts "The time you entered is: #{times}"
    puts "Is this information correct? Type 'yes' to confirm or 'EXIT' to quit"
    confirm = gets.chomp
  end
  if confirm == 'yes'
    username.remove_time(database, day, time)
    username.print_schedule
  end
  return username
end

def user?(username)
  if username == nil
    puts "Please sign in first"
  else
    return false
  end
end

loop do
  puts "1. create a user account"
  puts "2. login to scheduler"
  puts "3. add time to schedule"
  puts "4. remove time from schedule"
  puts "5. print your schedule"
  puts "'EXIT' to quit the program"
    input = gets.chomp
    user ||= nil
      if input == '1'
        user = new_user(database)
        p user
      elsif input == '2'
        user = existing_user(database)
      elsif input == '3'
        if user?(user)
          break
        else
          schedule_times(user, database)
        end
      elsif input == '4'
        if user?(user)
          break
        else
          unschedule_times(user, database)
        end
      elsif input == '5'
        if user?(user)
          break
        else
          user.print_schedule
        end
      elsif input == 'EXIT'
        break
      end
end