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
    return display_status, update_word(letter)
  end

  # I tried not to use this patch, but there was not a way around 
  # it I could find. The output display would add incorrect guesses 
  # to the end of the underscores.
  # (some five letter word would become ==> '_ _ _ _ _ <incorrect letter>'
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

player_guess = nil
puts "Let's play hangman!"
puts "Enter the word for your opponent to guess."
puts "Don't look player 2!"
player_word = gets.chomp
puts "The word has been chosen!"
puts "Enter your guess by letter or by the entire word! (type 'DONE' to quit)."
game_word = Hangman.new(player_word)
# users have to hit enter twice in order for the display to correctly 
# update. Looking for fix.
until player_guess == 'DONE'
  game_word.guess_letter(player_guess)
  player_guess = gets.chomp
end
puts "The word was #{game_word.word}!"
puts "Hope you had fun!"