#1. Ruby is meant to be readable and read almost like a narrative
#a. Naming
  #methods should be named as actions | maybe limit to 2-3 words, but should encapsulate what is going on
  #variables should be named as accurate representations of what they point to
  def display_list
    @list.each do |item, quantity|
      puts "Buy #{quantity} - #{item}"
    end
  end
  #methods that deal with booleans should have ?, things that perform 'irreversible' actions with a !, things that set something with an =

#b. Spacing / Indentation
  # make sure code is properly indented
  # https://github.com/airbnb/ruby
  # https://github.com/thoughtbot/guides/tree/master/style/ruby
  # when working with hashes, take a look at some style-guide in order to make this info more readable

#c. Organization
  #group meaningful processes together and then add a line break; document doesn't need to be essentially double spaced, so use sparingly
  # context for separating code with white space into relevant sections - https://robots.thoughtbot.com/how-we-test-rails-applications
  first_molding = mold_input_one_way(input)
  second_molding = mold_input_second_way(first_molding)
  third_molding = mold_input_third_way(second_molding)

  third_molding.each do |thing|
    #...code
  end

  result = some_data_per_previous_iteration

  #within context of a class, have couple of options - a. alphabetize methods | b. group methods by functionality


# last evaluated expression in a method is the return of that method

def test
  2 + 2
  'hello'
  2
  puts 5 * 5
end
# puts returns nil
# each returns original collection
# map returns new array of result where the block is the respective element for each element in the original array
#stay away from doing destructive methods

new_numbers = []

numbers = [1,2,3,4,5]

numbers.each do |n|
  new_numbers << n + 1
end

new_numbers_some_obsenly_largely = numbers.map do |n|
                                    n + 1
                                   end