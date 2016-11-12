class Hangman
  def initialize(word)
    @word = word
    @word_hash = {}
  end

  def word_to_hash
    w_arr = @word.split('')
    w_arr.each do |letter|
      @word_hash[letter] = false
    end
    return @word_hash
  end

  def word
    @word
  end

end