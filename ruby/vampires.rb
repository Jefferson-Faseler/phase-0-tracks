puts "How many employees will be processed?"
num_emp = gets.chomp.to_i

def age_verifier( x, y)
  current_year = Time.now.year
    if x + y == current_year
      true
  else 
      false
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
  
  begin
    puts "Do you have any allergies?"
    puts "List them one at a time and type done when finished"
    allergies = gets.chomp
      if allergies == "sunshine"
        break
      end
  end until allergies == "done"

  if allergies != "sunshine" && (age_verifier( age, dob) == true && (bread == "yes" || insurance == "yes")) 
    puts "Probably not a vampire"
  elsif allergies == "sunshine" || (age_verifier( age, dob) == false && (bread == "no" || insurance == "no"))
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

print "Actually, never mind! What do these questions have to do with anything? Let's all be friends."