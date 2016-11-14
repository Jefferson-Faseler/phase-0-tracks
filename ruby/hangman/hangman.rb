class Hangman
  attr_reader :word, :update, :updated_string, :guess_count

  def initialize(word)
    @word = word.downcase.strip
    @guess_count = 0
    @update = Array.new(word.length, '_')
    @word_array = @guess_arr = word_array = @word.split('')
    guess_counter(word_array)
  end

  def guess_counter(word_array)
    length = word_array.length / 2
    chars = word_array.uniq.length * 1.5
    @guess_count = length + chars.to_i
  end
  
  def guess_letter(letter)
    @letter_guess = letter
    if letter == @word
      @updated_string = letter
    elsif @guess_arr.include?(letter)
      @guess_arr
    else 
      @guess_arr << letter
      @guess_count -= 1
    end
    guess_to_update(letter)
    return @guess_arr
  end

  def guess_to_update(letter)
    if letter == @word
      @word 
    elsif @updated_string != @update.join(' ')
      update_word(letter)
    end
    display_status
  end

  def monkey_patch
    while @update.length > @word.length
      @update.pop
    end
    @update
  end

  def update_word(letter)
    @word_array.each_index do |letter_index|
      if @word_array[letter_index] == letter
        @update[letter_index] = letter
      end
    end
    monkey_patch
    @updated_string = @update.join(' ')
    @updated_string
  end

  def display_status
    if @guess_count <= 0
      message = 'Do you even lift?'
    elsif !@update.include?('_')
      message = 'Wow! You did it!'
    else
      message = "Guesses remaining: #{@guess_count}"
    end
    puts message
    puts @updated_string
    return @updated_string, @guess_count
  end
end