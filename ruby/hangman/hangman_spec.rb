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

## combined these methods during rspec testing for efficiency
# another user to enter letters for guess
# input letter as argument
# steps: 
#   compare to guess-arr
# output: return comparison
# compare guessed letter to guess-arr
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
#   if letter is equal to key change value to true
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
    expect(hangman.guess_letter('c')).to eq [['a','b','c','d','e'], 9]
    expect(hangman.guess_letter('c')).to eq [['a','b','c','d','e'], 9]
    expect(hangman.guess_letter('a')).to eq [['a','b','c','d','e'], 9]
    expect(hangman.guess_letter('z')).to eq [['a','b','c','d','e','z'], 8]
  end

  it "compares letter to array of word letters" do
    temp = Hangman.new('abcde')
    expect(temp.update).to eq(['_','_','_','_','_'])
    temp.guess_letter('c')
    expect(temp.update).to eq(['_','_','c','_','_'])
  end

  it "display word as string with underscores for unguessed characters" do
    expect(hangman.update_word('z')).to eq('_ _ _ _ _')
    expect(hangman.update_word('c')).to eq('_ _ c _ _')
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
    temp = Hangman.new('abc') # 5 guesses
    temp.guess_letter('d')    # 4
    temp.guess_letter('e')    # 3
    temp.guess_letter('f')    # 2
    temp.guess_letter('g')    # 1
    temp.guess_letter('h')    # lose
    expect(temp.display_status).to eq(['_ _ _', 0])
  end
end




