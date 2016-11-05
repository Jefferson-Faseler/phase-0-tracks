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

def alias_dispenser(name)
  
  def vowel_swap(vowel)
    v_index = 0
    vowels = ['a','e','i','o','u']
    vowels.each {|i| 
      if vowel == 'u'
        vowel = 'a'
      elsif i == vowel
        vowel = vowels[v_index + 1]
      else
        v_index += 1
      end
    }
    vowel
  end

  def con_swap(consonant)
    c_index = 0
    consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s',
      't','v','w','x','y','z']
    consonants.each {|c|
      if consonant == 'z'
        consonant = 'b'
      elsif c == consonant
        consonant = consonants[c_index + 1]
      else
        c_index += 1
      end
    }
    consonant
  end

  def capitalize(name_array)
    num_names = name_array.length
    

  name_array = name.downcase.split('')
  name_array.map!{|letter|
      if (letter =~ /[^aeiou]/)
        con_swap(letter)
      elsif (letter =~ /[aeiou]/)
        vowel_swap(letter)
      end
  }
  name_array.join.split.capitalize.join
end

print alias_dispenser("Felicia Torres")
