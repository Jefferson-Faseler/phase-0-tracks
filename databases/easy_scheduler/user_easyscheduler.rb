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


class User

  def initialize(name)
    @name = name
    @schedule = {}
  end

  def add_to_schedule(day, time, length)
    @schedule[day] ||= []
    length.times do 
      @schedule[day].push(time).uniq!
      time += 1
    end
    @schedule
  end

# method takes time as optional argument, deleting day if no argument
# was given or deleting specific times if argument was given
  def remove_time(day, *time)
      if @schedule[day].include?(time[0])
        i = 0
        until !@schedule[day].include?(time[i])
          @schedule[day].delete(time[i])
          i += 1
        end
      elsif time.empty?
        @schedule.delete(day)
      end
    @schedule
  end

  def print_schedule
    puts 'Your entire schedule for this week:'
    @schedule.each_key do |day|
      puts "On #{day} you are free at these times:"
      @schedule[day].each {|time| puts "#{time}"}
    end
  end

end


## DRIVER CODE ##
temp = User.new('John Smith')
# => <User:0x007f977d011d98 @name="John Smith", @schedule={}>
temp.add_to_schedule('Mon', 6,4)
# => {"Mon"=>[6, 7, 8, 9]}
temp.add_to_schedule('Tue',7,3)
# => {"Mon"=>[6, 7, 8, 9], "Tue"=>[7, 8, 9]}
temp.print_schedule
  # Your entire schedule for this week:
  # On Mon you are free at these times:
  # 6
  # 7
  # 8
  # 9
  # On Tue you are free at these times:
  # 7
  # 8
  # 9

