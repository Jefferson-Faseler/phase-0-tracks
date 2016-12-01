This program is designed for a user to schedule their free time and use it to compare their schedule with another user. The comparison will return a result of all the times in a day the two can meet.

This program was inspired by the number of times that I could not communicate my complicated schedule with peers during phase 0.

I've listed all the pseudocode by file below for reference:

scheduler_method.rb
# create user for people new to the program
# => Steps: pass in username as parameter
# => insert the new username into the database in users table
# output: return nothing if successful

# find the username of an existing user
# => Steps: pass in username as parameter
# => assign the output from database users table
# => to local method variable for readability
# output: return that local method variable

# print a user's schedule
# => Steps: pass in username as parameter
# => find user_id with method
# => find all the days that match user_id from schedules table
# => print out each day and each time for that day with interpolation
# => find each day_id with method
# output: print to screen

# check for proper user input for typed days
# => Steps: pass in user input as parameter
# => If day parameter is or is not in the array, return output
# output: return true or false

# verify that user input time is not already in the database
# => Steps: collect count of all times matching parameters
# => If the count is more than 1 go to method to remove duplicate times
# => Else move on
# output: return true or false for duplicate times

# remove duplicate times
# => Steps: remove all times matching parameters 
# => Except for the time with the biggest id
# output: return updated database

# add user input times to the database
# => Steps: Pass in user input as parameters
# => Find user_id to add to schedules table
# => add the input to the schedules table
# => Call time verification method
# output: updated database

# remove user input times from the database
# => Steps: Pass user input as parameters
# => Find user_id to remove from schedules table
# => delete all times matching parameters
# output: updated schedules table

# compare the days a user has with another user they wish to meet with
# => Steps: pass user input as parameters
# => find both user ids
# => compare both user ids to schedules table
# => if they have days that match go to next method for comparing times
# => if they do not have matching days print message
# output: move on to next method or print message

# compare and print matching user times
# => Steps: pass parameters from comparing days
# => find all time ids from schedules table
# => compare and keep all matching times
# outout: print all matching times as array

# find day id from days table
# => Steps: compare day parameter to days table
# output: return day_id

# find user id from users table
# => Steps: compare username parameter to users table
# output: return user_id

# find all days matching user_id
# => Steps: use subquery to compare user_id parameter to schedules table
# => return to query all matching day_ids and find the day names for each
# output: return all matching days by name from schedules table

# find all times belonging to a user in a day
# => Steps: compare user_id and day_id to schedules table
# output: return all matching times from schedules table


------------------------------------------------------------------------

scheduler_ui.rb
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