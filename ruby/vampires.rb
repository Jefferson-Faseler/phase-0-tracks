puts "What is your name?"
name = gets.chomp
puts "How old are you?"
age = gets.chomp.to_i
puts "What year were you born?"
dob = gets.chomp.to_i
puts "Our company cafeteria serves garlic bread. Should we order some for you?"
bread = gets.chomp
puts "Would you like to enroll in the company's health insurance?"
insurance = gets.chomp

def age_verifier( x, y)
  current_year = Time.now.year
  if x + y == current_year
    pass = true
  else 
    pass = false
  end
end

wolves_like_sunshine = true
wolves_like_garlic = true
vampires_like_sunshine = false
vampires_like_garlic = false

if age_verifier( age, dob) == true && (bread == "yes" || insurance == "yes")
  puts "Probably not a vampire"
elsif age_verifier( age, dob) == false && (bread == "no" || insurance == "no")
  puts "Probably a vampire"
elsif age_verifier( age, dob) == false && bread == "no" && insurance == "no"
  puts "Almost certainly a vampire"
elsif name == "Drake Cula" || name == "Tu Fang"
  puts "Definitely a vampire"
else 
  puts "Results inconclusive"
end