# hangman should have user enter word.
# new user enters a letter to guess that word.
# that letter is compared to the word by index.
# displays the letter and its place if it is in the word.
# if not it adds a strike out of amount. 
#   strike maximums are determined by value each unique character
#   and by the length of the word
#     1.5 strikes per uniq char
#               +
#     1/2 point per letter length
#               = 
#     strike max
# if a letter has alrady been guessed 
# it does not count against the player.
# prints the resluts after each guess 
#   underscores for unguessed letter 
#   and the letter for correct guesses.

require_relative 'hangman'

describe Hangman do
  it "compares letter to word" do
  end

  it "displays letter in word if guessed correctly" do
  end

  it "adds strike to maximum strike count" do
  end

  it "does not add strike if letter has been guessed" do
  end

end