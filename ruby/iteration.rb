def example
	puts "red, green, blue"
	yield("yellow", "turqoise")
end

example { |colors1, colors2| puts "my favorite colors are #{colors1} and #{colors2}" }


cheese = ["cheddar", "bleu", "mozzarella", "gouda", "swiss", "parmesan"]

crackers = {
	wheat_thin: true,
	cheese_its: false,
	communion_crackers: false,
	trisquits: true,
	saltines: false,
	mark_zuckerberg: true
}

=begin
	
Demonstrate that you can iterate through each one using .each, and then using .map! 
(modifying the data in some way). Note that you can't call .map! on a hash, 
so you can skip that (.map returns an array, so a destructive map method is 
logically impossible on a hash). Print the data structures before and after each 
call to demonstrate whether they have been modified or not.
	
=end
p cheese
p crackers

puts "iterate through the cheese array: "

cheese.each do |type| 
	puts type
end

puts "Use map to capitalize each item in cheese array and print the new array: "

cheese.map! do |type| 
	type.capitalize
end

p cheese

cheese.each do |type| 
	puts type
end

puts "Use each to iterate through crackers hash: "

crackers.each do |type|
	puts type
end

puts "print the cheese array and crackers hash again: "

p cheese
p crackers

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.delete_if {|number| number.even?}
puts numbers

states_and_capitals = {
	California: "Sacramento",
	New_York: "Albany",
	Texas: "Austin",
	Nevada: "Reno"
}

states_and_capitals.delete_if {|state, capital| capital =~ /[A]/}
puts states_and_capitals

puts "============="

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.keep_if {|number| number.even?}
puts numbers

states_and_capitals = {
	California: "Sacramento",
	New_York: "Albany",
	Texas: "Austin",
	Nevada: "Reno"
}

states_and_capitals.keep_if {|state, capital| capital =~ /[A]/}

puts states_and_capitals

puts "============="

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.select! {|number| number > numbers[5]}
puts numbers

states_and_capitals = {
	California: "Sacramento",
	New_York: "Albany",
	Texas: "Austin",
	Nevada: "Reno"
}

states_and_capitals.keep_if {|state, capital| capital.length > 4}

puts states_and_capitals

puts "============="

#A method that will remove items until the condition is false, then stops 
#(you may not find a perfectly working option for the hash, and that's okay).

#A method that will take out items from the array or hash when it evaluates to true
#and stop taking them out when the item in array or hash becomes false 
#(you may not find a perfectly working option for the hash, and that's okay).


def new_numbers
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	numbers.drop_while {|number| number < 4}
end

puts new_numbers

states_and_capitals = {
	California: "Sacramento",
	New_York: "Albany",
	Texas: "Austin",
	Nevada: "Reno"
}


states_and_capitals.delete_if {|state, capital| capital.length > 6}
puts states_and_capitals


