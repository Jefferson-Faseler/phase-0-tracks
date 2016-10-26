puts "How many employees will be processed?"
num_emp = gets.chomp.to_i

def age_verifier( x, y)
  current_year = Time.now.year
    if x + y == current_year
    pass = true
  else 
    pass = false
  end
end

until num_emp == 0
  puts "#{num_emp} quizzes remaining"
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
  
  until allergies == "done" || allergies == "sunshine"
    puts "Do you have any allergies?"
    allergies = gets.chomp
  end

  if age_verifier( age, dob) == true && (bread == "yes" || insurance == "yes")
    puts "Probably not a vampire"
  elsif age_verifier( age, dob) == false && (bread == "no" || insurance == "no") || allergies == "sunshine"
    puts "Probably a vampire"
  elsif age_verifier( age, dob) == false && bread == "no" && insurance == "no"
    puts "Almost certainly a vampire"
  elsif name == "Drake Cula" || name == "Tu Fang"
    puts "Definitely a vampire"
  else 
    puts "Results inconclusive"
  end

  num_emp = num_emp - 1
end

puts "Finished"