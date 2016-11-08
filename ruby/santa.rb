class Santa
  
  def speak
    puts "Ho, ho, ho! Happy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def initialize
    puts "Initializing Santa instance."
  end

end

## DRIVER CODE ##
beardy = Santa.new.speak
# ==> Initializing Santa instance.
# ==> Ho, ho, ho! Happy holidays!
fatherxmas = Santa.new.eat_milk_and_cookies("double chocolate")
# ==> Initializing Santa instance.
# ==> That was a good double chocolate!

