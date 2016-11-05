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

  def organizer(_alias)
    alias_to_string = _alias.join.capitalize
    string_to_array = alias_to_string.split.reverse
    new_first_name = string_to_array[0].capitalize
    new_last_name = string_to_array[1].capitalize
    new_name_array = new_first_name + ' ' + new_last_name
  end

  name_array = name.downcase.split('')
  name_array.map!{|letter|
      if (letter =~ /[^aeiou]/)
        con_swap(letter)
      elsif (letter =~ /[aeiou]/)
        vowel_swap(letter)
      end
  }
  organizer(name_array)
end

puts "Welcome, agent"
puts "Enter your first and last name to recieve your alias."
agent_name = gets.chomp

until agent_name == "quit"
  
  puts "Your new alias is #{alias_dispenser(agent_name)}."
  puts "If you want another alias, enter a new first and last name."
  puts "Otherwise, type 'quit'"
  agent_name = gets.chomp

end 
