# Hangman.

# Player 1 picks a word. Player 2 must choose from
# the alphabet different letters to make up the
# word.

# If user 2 cannot figure out the word before
# the number of guesses reaches 0 then player 2 
# loses and player 1 wins. 

# define methods for:
# user to enter word

# transform word into list with values
# steps: 
#   split string into hash with letters as keys
#   set default values as false to indicate not guessed

# another user to enter letters for guess
# input letter as argument
# steps: 
#   compare to guess-hash

# compare guessed letter to guess-hash
# input instance variable
# steps: 
#   compare letter to each letter in guess-hash
#   if letter is equal to index change value to true

# compare the guessed letter to the word
# steps: 
#   compare letter to each letter in word-hash
#   if letter is equal to index change value to true

# display a printed version of the 
# correctly guessed letters with underscores 
# for letters that still need to be discovered
# steps: 
#   Print hash symbols for all values in word-hash that 
#   evaluate to true. 
#   If they evaluate to false print an underscore

# method to create num of guesses
# determined by length of word
# steps:
#   length of word is worth 1/2 a guess per char and each unique
#   character is worth 1.5 a guess

# method to return a message for win or lose
# steps:
#   if win "Good job"
#   else "Go back to school, bro."