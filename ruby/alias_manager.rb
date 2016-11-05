# swap first and last name
# changing all the vowels to the next vowel and all the consonants to the
# next consonant

# write a method that takes the name as an argument 
# at each index if the letter is a vowel it is equal to the 
# next index at vowel index
# write another method that does the same to consonants

# in the end there should be three methods, one for vowels one for consonants
# and then one that splits and joins the string

# for edge cases use byteslice.delete or reverse.chop.reverse
# be sure to downcase everything before you work on it and then when finished
# it ought to get .capitalize

def alias(name)
  n = name
  def vowel_swap(vowel)
    v_index = 0
    vowels = ['a','e','i','o','u']
    vowels.each {|i| 
      if i == vowel
        vowel = vowels[v_index + 1]
      else
        v_index += 1
      end
    }
    vowel
  end
    




  n.downcase!.split('').each{|letter| 
    n_index = 0
    while name_index < n.length
      if letter =~ /[^aeiou]


      }
