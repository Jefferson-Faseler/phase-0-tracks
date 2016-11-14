# Hangman.

# Player 1 picks a word. Player 2 must choose from
# the alphabet different letters to make up the
# word.

# If user 2 cannot figure out the word before
# the number of guesses reaches 0 then player 2 
# loses and player 1 wins. 

# define methods for:
# user to enter word
# steps:
#   pass in word as argument upon initialization
# output: return word

# transform word into list
# steps: 
#   split string into array for comparison and another 
#   array for comparing previously guessed letters
# output: initialization.

# method to create num of guesses
# determined by length of word
# steps:
#   length of word is worth 1/2 a guess per char and each unique
#   character is worth 1.5 a guess
# output: guess count to be given at intialization

# another user to enter letters for guess
# input letter as argument
# steps: 
#   compare to guess-arr with include? method
#   if user guesses the entire word at once end the game. 
# output: return comparison

# compare the guessed letter to the word
# steps: 
#   compare letter to each letter in word_array
#   if letter is equal to index change the display_array
#   at the matching index to the letter.
# output: return an array with updated letters

# display a printed version of the 
# correctly guessed letters with underscores 
# for letters that still need to be discovered
# steps: 
#   join the array with guessed letters and underscores into 
#   variable to display for the user.
# output: print string of letters and underscores

# method to return a message for game status
# steps:
#   if win "Good job"
#   if lose "Not good job"
#   continuously update with guesses remaining and updates string
# output: printed message

require_relative 'hangman'

describe Hangman do
let(:hangman) { Hangman.new('abcde') }
let(:hangman_apple) { Hangman.new('apple') } #to demonstrate opposing result

  it "allows user to enter word" do
    expect(hangman.word).to eq 'abcde'
    expect(hangman_apple.word).to eq 'apple'
  end

  it "creates number of guesses based on length and uniqe chars" do
    expect(hangman.guess_counter(['a','b','c','d','e'])).to eq 9
    expect(hangman_apple.guess_counter(['a','p','p','l','e'])).to eq 8
  end

  it "user enters letter and compares letter to array of guessed letters" do
    expect(hangman.guess_letter('c')).to eq(['a','b','c','d','e'])
    expect(hangman.guess_letter('c')).to eq(['a','b','c','d','e'])
    expect(hangman.guess_letter('z')).to eq(['a','b','c','d','e','z'])

    temp = Hangman.new('answer')
    expect(temp.guess_letter('answer')).to eq(['a','n','s','w','e','r'])
  end

  it "compares letter to array of word letters" do
    expect(hangman.update).to eq(['_','_','_','_','_'])
    hangman.guess_letter('c')
    expect(hangman.update).to eq(['_','_','c','_','_'])

    expect(hangman_apple.update).to eq(['_','_','_','_','_'])
    hangman_apple.guess_letter('p')
    expect(hangman_apple.update).to eq(['_','p','p','_','_'])
  end

  it "display word as string with underscores for unguessed characters" do
    expect(hangman.update_word('z')).to eq(['_ _ _ _ _', 9])
    expect(hangman.update_word('c')).to eq(['_ _ c _ _', 9])
  end

  it "display updated string with current guess count" do
    temp = Hangman.new('abcde')
    temp.update_word('z')
    temp.update_word('c')
    expect(temp.display_status). to eq ['_ _ c _ _', 9]

    temp.update_word('e')   
    expect(temp.display_status).to eq(['_ _ c _ e', 9])

    hangman_apple.update_word('p')
    expect(hangman_apple.display_status).to eq(['_ p p _ _', 8])
  end

  it "output text for win or lose" do
    temp = Hangman.new('abc')
    temp.guess_letter('d')
    temp.guess_letter('e')
    temp.guess_letter('f')
    temp.guess_letter('g')
    temp.guess_letter('h')
    expect(temp.display_status).to eq(['_ _ _', 0])
  end
end