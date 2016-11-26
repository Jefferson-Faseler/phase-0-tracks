# Allow each user to have their own schedule viewable by them 
# and accessible for comparison to another user's schedule
  # create user class with intialized hash empty 
  # (later to be filled with each hour that is free)
    # steps: create user class with initialize method that takes name as parameter
    # set two instance variables name and schedule
  # output: returns empty schedule

# Allow each user to add times to their schedule
  # insert nested key value pairs for day and time into hash
    # when user enters day it creates key, with nested array for value
    # array elements are hour blocks the user is free
  # output: return updated hash

# Allow user to remove a date from their schedule
  # use #delete on day the user would like to remove
  # output: return updated schedule




class User

  def initialize(name)
    @name = name
    @schedule = {}
  end

  def add_to_schedule(day, time, length)
    @schedule[day] = []
    length.times do 
      @schedule[day].push(time)
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

  def schedule
    @schedule
  end

end



