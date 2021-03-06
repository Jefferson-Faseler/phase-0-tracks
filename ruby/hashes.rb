# Boolean converter designed for strings, not other data types
def boolean_converter(answer)
  answer == "yes" || answer == "y" || answer ==  "Yes"
end

## INTERIOR DESIGNER CLIENT LIST ##

# Ask user for client name, age, number of children,
# decor theme, designer freedom, and pets.
# Convert all the info to the proper data types

puts "Input information about your client"

puts "Name:"
name = gets.chomp

puts "Age:"
age = gets.chomp.to_i

puts "Number of children:"
children = gets.chomp.to_i

puts "Decor theme:"
decor_theme = gets.chomp

puts "Designer freedom?:"
creativity = boolean_converter(gets.chomp) #saves user input as boolean

puts "Pets:"
pets = gets.chomp.to_i      #takes in number of pets
  if pets > 0               #if there are any pets it asks questions
    # User can give each type individually or each type collectively
    puts "There are #{pets} pets, input all the types:"
    pet_type = gets.chomp
    # Adds values to the array for each type and splits them by each space
    types_of_pets = pet_type.split(/\s+/)
    types_of_pets.uniq! #removes all duplicate animal types
    puts "The pets your client has are #{types_of_pets.join(', ')}"
  end

# hash containing all values
client_info = {
  age: age,
  children: children,
  decor_theme: decor_theme,
  creativity: creativity,
  pets: pets,
  types_of_pets: types_of_pets
}

# Print the hash when the designer has finished all prompts
p client_info


# Give the user the opportunity to update a key
puts "Do you need to make any changes to the client details?"
detail_changes = gets.chomp

#if answer "yes" user can change detail
if boolean_converter(detail_changes)
  puts "Which detail would you like to change?"
  detail = gets.chomp.to_sym
  puts client_info[detail]
  puts "Type in the new detail"
  client_info[detail] = gets.chomp
end

# Print it and exit
p client_info