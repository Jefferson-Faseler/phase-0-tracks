require_relative 'scheduler'
require_relative 'scheduler_method'
require 'sqlite3'

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
    if day_of_week?(day)
      rollover_time_check(time, length, day, username)
      print_schedule(username)
    else
      puts "#{day} is not a day of the week."
    end
  end
end

def day_of_week?(day)
  days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  if days_of_week.include?(day)
    return true
  end
end

def rollover_time_check(time, length, day, username)
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

def unschedule_times!(username)
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
    delete_from_db!(day, time, username)
    print_schedule(username)
  end
end

def compare_two_schedules(username)
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

def signed_in?(user)
  if user != nil
    return true
  else 
    puts "Please sign in first" 
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
        if signed_in?(user)
          schedule_times(user)
        end
      elsif input == '4'
        if signed_in?(user)
          unschedule_times!(user)
        end
      elsif input == '5'
        if signed_in?(user)
          print_schedule(user)
        end
      elsif input == '6'
        puts $database.execute("SELECT name FROM users")
      elsif input == '7'
        if signed_in?(user)
          compare_two_schedules(user)
        end
      elsif input == 'EXIT'
        break
      end
end