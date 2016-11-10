class Hangman

  def initialize(word)
    puts "Initialize"
    @word = word.split('')
  end

  def compare(letter)
    @word.each do |i|
      if i == letter
        true
      else 
        false
      end
    end
  end

end