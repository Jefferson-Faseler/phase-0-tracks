class Hangman
  def initialize(word)
    @word = word
    @word_hash = {}
    @guess_count = 0
    @guess_arr = []
    w_arr = word.split('')
    @w_arr = w_arr
    @guess_arr = w_arr
    @w_board = w_arr.map {|letter| '_'}
    guess_counter(w_arr)
    word_to_hash
    @array_of_true
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
    else 
      @guess_arr << letter
      @guess_count -= 1
      compare(letter)
    end
    return @guess_arr, @guess_count
  end

  def compare(letter)
    if @word_hash.include?(letter)
      @word_hash.each do |key, value|
        if key == letter
        @word_hash[key] = true
        end
      end
    end
    @word_hash
  end

  def w_display
    @array_of_true = []
    if @word_hash.has_value?(true)
      @word_hash.each_pair do |letter, bool|
        @array_of_true << letter if bool == true
      end
    end
    intersection = @w_arr & @array_of_true
    intersection.each do |letter|
      w_index = @w_arr.find_index(letter)
      @w_board.delete_at(w_index)
      @w_board.insert((w_index), letter)
    end
    @display = @w_board.join(' ')
    @display
  end

  def win_message
    if @w_board.include?('_') == false
      puts 'Good job! You did the impossible!'
    end
  end

  def lose_message
    if @guess_count <= 0
      puts 'Do you even lift?'
    end
  end


  def word
    @word
  end

  def w_board
    @w_board.join(' ')
  end

  def guess_count
    @guess_count
  end
end

h = Hangman.new('abcde')
h.compare('c')
h.w_display