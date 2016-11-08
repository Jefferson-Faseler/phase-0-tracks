class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(bark)
    bark.times {|x| puts "woof"}
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(years)
    age = years * 7
    puts "The dog is #{age} in dog years."
  end

  def shake
    puts "*The dog shakes your hand*"
  end

end

# ## DRIVER CODE

puppy = Puppy.new
puppy.fetch("ball")
## ==> I brought back the ball!
puppy.speak(5)
## ==> working
puppy.roll_over
## ==> *rolls over*
puppy.dog_years(3)
## ==> the dog is 21 years old!
puppy.shake
## ==> *shakes hand*

