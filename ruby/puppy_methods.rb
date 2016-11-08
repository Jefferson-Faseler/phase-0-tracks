class Puppy

  def initialize
    puts "Initializing new puppy instance..."
  end

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

class Books

  def initialize
    puts "---------------------------"
    puts "Initializing instance of books"
  end

  def comic_books
    puts "Comic books. Kapow!"
  end

  def novel
    puts "Novels are so romantic..."
  end

  def textbook
    puts "Textbooks are boooooooooooooooring."
  end

  def childrens_book
    puts "Cow goes moo."
  end

end

books = Books.new
stored_books = []

while stored_books.length <= 50
  book = Books.new
  stored_books << book
end

stored_books.each do |books|
  books.comic_books
  books.novel
  books.textbook
  books.childrens_book
end

p stored_books
