class Hangman
  
  def word_to_arr(word)
    @word = word
    @word_arr = word.split('')
  end

  def letter_guess(letter)
    @letter = letter
  end

  def compare(word_arr, letter)
    if word_arr.include?(letter)
      @letter_index = word_arr.find_index(letter)
    else
      false
    end
    @letter_index
  end

  def morph_arr(word_arr)
    @morphed = word_arr.map {|i| '_'}
  end
 
  # def display(letter, letter_index)
  #   morph_array(@word_arr)
  #   @morphed.delete_at(@letter_index).insert(@letter_index, letter).join(' ')
  # end

  # def morphed
  #   @morphed
  # end

  # def morphed_array
  #   @morphed_array
  # end

  # def word_arr
  #   @word_arr
  # end

  # def letter_index
  #   @letter_index
  # end

  # def letter_index=(integer)
  #   @letter_index
  # end

  # def guess=(letter)
  #   @letter
  # end

  # def morph=(arr)
  #   @morphed
  # end

end