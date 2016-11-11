class Hangman
  
  def initialize(word)
    puts "Initialize"
    @word = word
    @word_arr = word.split('')
    word_len = word.length
    @morph = Array.new(word_len, '_')
  end

  def compare(letter)
    @word_arr.each do |i|
      if i == letter
        @letter_index = @word.index(i)
      end
    end
    @letter_index
  end

  def morph_array(word_arr)
    @morph = word_arr.map {|i| '_'}
  end
 
  def display(letter, letter_index)
    morph_array(@word_arr)
    @morph.delete_at(@letter_index).insert(@letter_index, letter).join(' ')
  end

  def morphed
    @morph
  end

  def morphed_array
    @morphed_array
  end

  def word_arr
    @word_arr
  end

  def guess=(letter)
    @letter
  end

  def morph=(arr)
    @morph
  end

end