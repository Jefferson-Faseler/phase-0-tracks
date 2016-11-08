class Santa
  
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance."
    @gender = gender
    @ethnicity = ethnicity
    @age = 0
  end
  
  def speak
    puts "Ho, ho, ho! Happy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", 
    "Comet", "Cupid", "Donner", "Blitzen"]

end

# ## DRIVER CODE ##
# beardy = Santa.new.speak
# # ==> Initializing Santa instance.
# # ==> Ho, ho, ho! Happy holidays!
# fatherxmas = Santa.new.eat_milk_and_cookies("double chocolate")
# # ==> Initializing Santa instance.
# # ==> That was a good double chocolate!

santas = []
santa_genders = []
santa_ethnicities = []

puts "How many Santas are signing up?"
num_of_santas = gets.chomp.to_i

num_of_santas.times do
  puts "Hello, Santa. Tell me about yourself."
  puts "gender: "
  santa_genders << gets.chomp
  puts "ethnicity: "
  santa_ethnicities << gets.chomp
end

num_of_santas.times do |i|
  santas << Santa.new(santa_genders[i], santa_ethnicities[i])
end

