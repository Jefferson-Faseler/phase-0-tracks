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

  

  def schedule
    @schedule
  end



end 