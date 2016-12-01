require_relative 'scheduler'
require_relative 'scheduler_method'
require_relative 'view'
require 'sqlite3'

DAYS_OF_WEEK = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

def new_user
  new_user = View.get_new_user
  create_user(new_user)
  find_username(new_user).flatten.join
end

def existing_user
  existing_user = View.get_existing_user
  user = find_username(existing_user)
  user.flatten!.join
end

def schedule_times(username)
  confirmation = retrieve_confirmation

  if confirmation
    rollover_time_check(confirmation[:time], confirmation[:availability], confirmation[:day], username)
    print_schedule(username)
  end
end

def confirmed_yes?(confirmation)
  confirmation == 'yes'
end

def confirmed_exit?(confirmation)
  confirmation == 'exit'
end

def valid_day?(day)
  !DAYS_OF_WEEK.include?(day)
end

def retrieve_confirmation
  loop do
    day = View.get_day
    if valid_day?(day)
      View.display_day_error(day)
      next
    end
    time = View.get_time
    availability = View.get_availability

    View.display_simple_confirmations({day: day, time: time})
    View.display_availability_confirmation(availability)

    confirmation = View.get_ending_confirmation
    if confirmed_exit?(confirmation)
      return nil
    elsif confirmed_yes?(confirmation)
      return {day: day, time: time, availability: availability}
    end
  end
end


###########STOPED#############

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

###############RESTARTED################

View.display_welcome

user = nil
loop do
  View.display_options
  option_selection = gets.chomp
  case option_selection
  when '1'
    user = new_user
    puts "You are signed in as #{user}"
  when '2'
    user = existing_user
    puts "You are signed in as #{user}"
  when '3'
    if signed_in?(user)
      schedule_times(user)
    end
  when '4'
    if signed_in?(user)
      unschedule_times!(user)
    end
  when '5'
    if signed_in?(user)
      print_schedule(user)
    end
  when '6'
    puts $database.execute("SELECT name FROM users")
  when '7'
    if signed_in?(user)
      compare_two_schedules(user)
    end
  when 'EXIT'
    break
  end
end
