puts "How many employees will be processed?"
num_emp = gets.chomp.to_i

# method is used to see if an employee's age and birthyear add up to the 
# current year. Only works if they have alraedy had their birthday in the year.
def age_verifier( x, y)
  current_year = Time.now.year
    if x + y == current_year
      true
    else 
      false
    end
end

# loop is used to repeat the quiz depending on the number of employees
# entered on line 2
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
  
# loop for employee to list allergies until they either type "done" or "sunshine"
  begin
    puts "Do you have any allergies?"
    puts "List them one at a time and type done when finished"
    allergies = gets.chomp
      if allergies == "sunshine"
        break
      end
  end until allergies == "done"

=begin 
  the following logic does not give undeniable proof, but only probabilities
  if an employee shows no signs with the questions, but enters sunshine as an 
  allergy it will trigger the "probably a vampire" result. However, there are
  other signs that can show a stronger correlation than an allergy to sunshine. 
  Thus, we see that despite the answers for the last questions, a name can 
  trigger a very positive probability. It is possible for an employee to get an 
  inconclusive result, even if they answer in appropriate yes/no terms and 
  integers, respective to the question.
=end

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