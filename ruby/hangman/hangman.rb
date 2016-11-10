class Hangman

  def initialize(word)
    puts "Initialize"
    @word = word.split('')
  end

  def compare(letter)
    @word.each do |i|
      if i == letter
        @guessed_letter = true
      else 
        @guessed_letter = false
      end
    end
  end

  def morph_array(word_arr)
    @morph = word_arr
    @morph.map! {|i| '_'}
  end

end