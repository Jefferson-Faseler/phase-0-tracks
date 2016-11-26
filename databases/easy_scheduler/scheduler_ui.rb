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

new_user(database)