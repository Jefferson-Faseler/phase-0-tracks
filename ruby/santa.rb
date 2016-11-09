class Santa
  
  attr_reader :age, :ethnicity, :reindeer_ranking
  attr_accessor :age

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance."
    puts "This Santa is a #{gender} #{ethnicity}."
    @gender = gender
    @ethnicity = ethnicity
    @age = 0
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", 
      "Comet", "Cupid", "Donner", "Blitzen"]
  end
  
  def speak
    puts "Ho, ho, ho! Happy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def get_mad_at(reindeer_name)
    r_index = @reindeer_ranking.find_index(reindeer_name)
    @reindeer_ranking.insert(9, reindeer_name).delete_at(r_index)
  end

  def gender=(new_gender)
    @gender = new_gender
  end

end

# ## DRIVER CODE ## ----------------------------------------------
# beardy = Santa.new.speak
# # ==> Initializing Santa instance.
# # ==> Ho, ho, ho! Happy holidays!
# fatherxmas = Santa.new.eat_milk_and_cookies("double chocolate")
# # ==> Initializing Santa instance.
# # ==> That was a good double chocolate!
## ----------------------------------------------------------------

# santas = []
# santa_genders = []
# santa_ethnicities = []

# puts "How many Santas are signing up?"
# num_of_santas = gets.chomp.to_i

# num_of_santas.times do
#   puts "Hello, Santa. Tell me about yourself."
#   puts "gender: "
#   santa_genders << gets.chomp
#   puts "ethnicity: "
#   santa_ethnicities << gets.chomp
# end

# num_of_santas.times do |i|
#   santas << Santa.new(santa_genders[i], santa_ethnicities[i])
# end

# ## DRIVER CODE ##-------------------------------------------------
# santas = []
# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# example_genders.length.times do |i|
#   santas << Santa.new(example_genders[i], example_ethnicities[i])
# end
# # ==> Printed santa unique codes and initializing string

# stnick = Santa.new("male", "black")
# p stnick.age
# # ==> 0
# stnick.celebrate_birthday
# p stnick.age
# # ==> 1
# p stnick.ethnicity
# # ==> "black"
# stnick.get_mad_at("Vixen")
# p stnick.reindeer
# # ==> "Vixen" from index 4 to 
# # ==> ["Rudolph", "Dasher", "Dancer", "Prancer", 
# # ==>"Comet", "Cupid", "Donner", "Blitzen", "Vixen"]

## ------------------------------------------------------------------

num_of_santas = 1000
santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
num_of_santas.times do |i|
  santas << Santa.new(example_genders.sample, example_ethnicities.sample)
end



