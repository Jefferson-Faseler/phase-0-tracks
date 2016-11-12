class Hangman
  def initialize(word)
    @word = word
    @word_hash = {}
    @guess_count = 0
    @guess_arr = []
    w_arr = word.split('')
    @guess_arr = w_arr
    guess_counter(w_arr)
    word_to_hash
  end

  def word_to_hash
    @guess_arr.each do |letter|
      @word_hash[letter] = false
    end
    @word_hash
  end

  def guess_counter(w_arr)
    length = w_arr.length / 2
    chars = w_arr.uniq.length * 1.5
    @guess_count = length + chars.to_i
  end
  
  def guess_letter(letter)
    @letter_guess = letter
    if @guess_arr.include?(letter)
      puts "You have guessed that letter already"
    else 
      @guess_arr << letter
      @guess_count -= 1
      puts @guess_count
      compare(letter)
    end
    return @guess_arr, @guess_count
  end

  def compare(letter)
    @word_hash.each do |key, value|
      if key == letter
      @word_hash[key] = true
      else
        puts "That letter is not in the word."
      end
    end
    @word_hash
  end

  def word
    @word
  end

  def guess_count
    @guess_count
  end
end