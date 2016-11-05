def alias_dispenser(name)

  def vowel_swap(vowel)
    v_index = 0
    vowels = ['a','e','i','o','u']
    vowels.each do |v|
      if v == vowel
        if v == 'u'
          vowel = 'a'
        else
        vowel = vowels[v_index + 1]
        end
      else
        v_index += 1
      end
    end
    vowel
  end

  def con_swap(consonant)
    c_index = 0
    consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s',
      't','v','w','x','y','z']
    consonants.each do |c|
      if c == consonant
        if c == 'z'
          consonant = 'b'
        else
          consonant = consonants[c_index + 1]
        end
      else
        c_index += 1
      end
    end
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

names_and_aliases = {}
puts "Welcome, agent"
puts "Enter your first and last name to recieve your alias."
agent_name = gets.chomp
alias_name = alias_dispenser(agent_name)
names_and_aliases[agent_name] = alias_name

until agent_name == "quit"

  puts "Your new alias is #{alias_dispenser(agent_name)}."
  puts "If you want another alias, enter a new first and last name."
  puts "Otherwise, type 'quit'"
  agent_name = gets.chomp
  names_and_aliases[agent_name] = alias_name
end

names_and_aliases.each do |agent_name, alias_name|
  if agent_name == 'quit'
    puts "Please close the program, agent."
  else
  puts "#{agent_name} is now #{alias_name}."
  end
end