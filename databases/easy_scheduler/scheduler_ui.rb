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

def schedule_times
  confirm = nil
  until confirm == 'yes' || confirm == 'EXIT'
    puts "Enter the day you would like to add to your schedule or enter 'EXIT' to quit"
    puts "(Days are case sensitive and cannot be abbreviated)"
    day = gets.chomp
    puts "Now enter the hour in 24 clock format"
    time = gets.chomp
    puts "How long will you be free during this block?"
    length = gets.chomp
    puts "The day you entered is: #{day}"
    puts "The time you entered is: #{time}"
    puts "And you said you would be for: #{length} hours"
    puts "Is this information correct?"
    confirm = gets.chomp
  end
end


new_user(database)
schedule_times