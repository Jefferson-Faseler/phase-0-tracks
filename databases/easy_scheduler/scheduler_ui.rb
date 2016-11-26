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

def new_user(database)
  puts "Welcome to easy scheduler"
  puts 'Please enter your full name: '
  fullname = gets.chomp
  new_user = User.new(fullname)
  new_user.create_user(database)
  return new_user
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
    puts 'Enter all the times you would like to remove, or simply press enter to remove the whole day.'
    times = gets.chomp
    puts "The day you entered is: #{day}"
    puts "The time you entered is: #{times}"
    puts "Is this information correct? Type 'yes' to confirm or 'EXIT' to quit"
    confirm = gets.chomp
  end
  if confirm == 'yes'
    username.remove_time(database, day, times)
    username.print_schedule
  end
  return username
end


unschedule_times(schedule_times(new_user(database),database),database)