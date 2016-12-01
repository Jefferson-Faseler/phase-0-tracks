class View

  def self.get_new_user
    puts 'Welcome to easy scheduler'
    puts 'Please enter a unique username:'
    new_user = gets.chomp
  end

  def self.get_existing_user
    puts 'Enter your username'
    existing_user = gets.chomp
  end

  def self.get_day
    puts "Enter the day you would like to add to your schedule"
    puts "(Days are case sensitive and cannot be abbreviated)"
    day = gets.chomp
  end

  def self.get_time
    puts "Now enter the hour in 24 clock format"
    time = gets.chomp.to_i
  end

  def self.get_availability
    puts "How long will you be free during this block?"
    availability = gets.chomp.to_i
  end

  def self.display_simple_confirmations(confirmations)
    confirmations.each do |label, data|
      puts "The #{label} you entered is: #{data}"
    end
  end

  def self.display_availability_confirmation(availability)
    puts "And you said you would be for: #{availability} hours"
  end

  def self.get_ending_confirmation
    puts "Is this information correct? Type 'yes' to confirm or 'EXIT' to quit"
    confirmation = gets.chomp
  end

  def self.display_day_error(invalid_day)
    puts "#{invalid_day} is not a day of the week."
  end

  def self.display_welcome
    puts "Welcome to the easy scheduler!"
    puts "Here you can input your free time!"
    puts "That free time can be kept track of, scheduled, or even compared to"
    puts "another user in our database."
    puts "Because free time and breaks are important."
  end

  def self.display_options
    puts "1. Create a user account"
    puts "2. Login to scheduler"
    puts "3. Add time to schedule"
    puts "4. Remove time from schedule"
    puts "5. Print your schedule"
    puts "6. List all users"
    puts "7. Compare schedule with another user"
    puts "'EXIT' to quit the program"
  end
end
