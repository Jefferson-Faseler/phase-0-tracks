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

# transform word into list with values
# steps: 
#   split string into hash with letters as keys
#   set default values as false to indicate not guessed
# output: return word hash

# method to create num of guesses
# determined by length of word
# steps:
#   length of word is worth 1/2 a guess per char and each unique
#   character is worth 1.5 a guess
# output: guess count to be given at intialization

# another user to enter letters for guess
# input letter as argument
# steps: 
#   compare to guess-hash
# output: return comparison

# compare guessed letter to guess-hash
# input instance variable
# steps: 
#   compare letter to each letter in guess-hash
#   if letter is equal to index change value to true
#     if already true do not update guess count
#     else update guess count
# output: updated guess hash values and guess counter

# compare the guessed letter to the word
# steps: 
#   compare letter to each letter in word-hash
#   if letter is equal to index change value to true
# output: return word hash with updated values

# display a printed version of the 
# correctly guessed letters with underscores 
# for letters that still need to be discovered
# steps: 
#   Print hash symbols for all values in word-hash that 
#   evaluate to true. 
#   If they evaluate to false print an underscore
# output: print hash symbols of word hash if value is true

# method to return a message for win or lose
# steps:
#   if win "Good job"
#   else "Go back to school, bro."
# output: printed message

require_relative 'hangman'

describe Hangman do
let(:hangman) { Hangman.new('abcde') }

  it "allows user to enter word" do
    expect(hangman.word).to eq 'abcde'
  end

  it "transforms string to hash with default values false" do
    expect(hangman.word_to_hash).to eq("a"=>false, "b"=>false, 
      "c"=>false, "d"=>false, "e"=>false)
  end

  it "creates number of guesses based on length and uniqe chars" do
    expect(hangman.guess_counter(['a','b','c','d','e'])).to eq 9
  end

  it "user enters letter" do
  end

  it "compares letter to hash of guessed letters" do
  end

  it "compares letter to hash of word letters" do
  end

  it "display word with underscores as unguessed characters" do
  end

  it "displays win/lose message" do
  end

end