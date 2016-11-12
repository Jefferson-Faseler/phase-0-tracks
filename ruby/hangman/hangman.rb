class Hangman
  def initialize(word)
    @word = word
    @word_hash = {}
    @guess_count = 0
  end

  def word_to_hash
    w_arr = @word.split('')
      guess_counter(w_arr)
    w_arr.each do |letter|
      @word_hash[letter] = false
    end
    @word_hash
  end

  def guess_counter(w_arr)
    length = w_arr.length / 2
    chars = w_arr.uniq.length * 1.5
    @guess_count = length + chars.to_i
  end

  def letter_guess=(letter)
    @letter_guess = letter
  end

  def word
    @word
  end

  def guess_count
    @guess_count
  end

end