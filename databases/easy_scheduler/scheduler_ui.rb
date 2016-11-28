# User interface with numbered menu for use
# => Steps: Use loop to give user the menu options repeatedly
# => take user input as numbers
# => if the user has not signed in, give an error message
# output: pass user to methods depending on choice

# create a new user
# => Take user input to insert username into database
# output: updated database

# find existing user
# => Steps: compare user input to database to find existing usename
# output: updated user variable

# walk a user through setting up a new time in their schedule
# based upon when they are free and for how long
# => Steps: Take user input and run them through loop until
# => until the user confirms or quits
# => Check user inputted times for edge cases
# => update database
# output: print the schedule to the user

# check user input for edge cases
# => Steps: if input rolls over the 24 hour clock it
# => moves the day_id up once
# => if that rolls over from Saturday, it reassigns the
# => day to Sunday
# output: updated input

# allow user to unschedule times
# => Steps: walk user through loop to remove one hour at a time
# => until user confirms or quits
# => remove the times from the database
# output: updated database


# print out the names of all users
# => Steps: print the names of all users from user table
# output: prints all names to screen

# allow user to compare their free time with another user
# => Steps: take user input for the second user's name
# => pass on to methods to find all matching days and times, if any
# output: print matching schedules to screen

# check to see if user is signed in
# => Steps: checks if user is still equal to nil
# output: prints message is not signed in

require_relative 'scheduler'
require_relative 'user_easyscheduler'
require 'sqlite3'

$database = SQLite3::Database.new('easy_scheduler.db')

def new_user
  puts 'Welcome to easy scheduler'
  puts 'Please enter a unique username:'
  new_user = gets.chomp
  create_user(new_user)
  find_username(new_user).flatten.join
end

def existing_user
  puts 'Enter your username'
  user = gets.chomp
  user = find_username(user)
  user.flatten!.join
end

def schedule_times(username)
  confirm = nil
  until confirm == 'yes' || confirm == 'EXIT'
    puts "Enter the day you would like to add to your schedule"
    puts "(Days are case sensitive and cannot be abbreviated)"
    day = gets.chomp
    puts "Now enter the hour in 24 clock format"
    time = gets.chomp.to_i
    puts "How long will you be free during this block?"
    length = gets.chomp.to_i
    puts "The day you entered is: #{day}"
    puts "The time you entered is: #{time}"
    puts "And you said you would be for: #{length} hours"
    puts "Is this information correct? Type 'yes' to confirm or 'EXIT' to quit"
    confirm = gets.chomp
  end
  if confirm == 'yes'
    check_before_add(time, length, day, username)
  print_schedule(username)
  end
end

def check_before_add(time, length, day, username)
  day_id = find_day_id(day).to_i
  length.times do
    if time >= 24
      time = 0
      day_id += 1
    end
    if day_id >= 8
      day_id = 1
    end
    add_to_db(day_id, time, username)
    time += 1
  end
end

def unschedule_times(username)
  confirm = nil
  until confirm == 'yes' || confirm == 'EXIT'
    puts 'Enter the day you would like to remove the time from.'
    day = gets.chomp
    puts 'Enter the hour you would like to remove.'
    time = gets.chomp
    puts "The day you entered is: #{day}"
    puts "The time you entered is: #{time}"
    puts "Is this information correct? Type 'yes' to confirm or 'EXIT' to quit"
    confirm = gets.chomp
  end
  if confirm == 'yes'
    delete_from_db(day, time, username)
    print_schedule(username)
  end
end

def compare_schedules(username)
  confirm = nil
  until confirm == 'yes' || confirm == 'EXIT'
    puts 'Enter the other user\'s name'
    second_user = gets.chomp
    puts "You entered: #{second_user}"
    puts "Is that correct? Type 'yes' to confirm or 'EXIT' to quit"
    confirm = gets.chomp
  end
  if confirm == 'yes'
    compare_user_days(username, second_user)
  end
end


puts "Welcome to the easy scheduler!"
puts "Here you can input your free time!"
puts "That free time can be kept track of, scheduled, or even compared to"
puts "another user in our database."
puts "Because free time and breaks are important."

user = nil
loop do
  puts "1. Create a user account"
  puts "2. Login to scheduler"
  puts "3. Add time to schedule"
  puts "4. Remove time from schedule"
  puts "5. Print your schedule"
  puts "6. List all users"
  puts "7. Compare schedule with another user"
  puts "'EXIT' to quit the program"
    input = gets.chomp
      if input == '1'
        user = new_user
        puts "You are signed in as #{user}"
      elsif input == '2'
        user = existing_user
        puts "You are signed in as #{user}"
      elsif input == '3'
        if user == nil
          puts "Please sign in first"
        else
          schedule_times(user)
        end
      elsif input == '4'
        if user == nil
          puts "Please sign in first"
        else
          unschedule_times(user)
        end
      elsif input == '5'
        if user == nil
          puts "Please sign in first"
        else
          print_schedule(user)
        end
      elsif input == '6'
        puts $database.execute("SELECT name FROM users")
      elsif input == '7'
        compare_schedules(user)
      elsif input == 'EXIT'
        break
      end
end