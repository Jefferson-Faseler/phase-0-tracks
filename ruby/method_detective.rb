# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

 "iNvEsTiGaTiOn".swapcase
 "iNvEsTiGaTiOn".swapcase!
# => “InVeStIgAtIoN”

 "zom".insert(1, 'o')
 z = "zom"; z.replace "zoom"
 "zom".gsub(/[o]/, 'oo')
 "zom".gsub!(/[o]/, 'oo')
 "zom".sub(/[o]/, 'oo')
 "zom".sub!(/[o]/, 'oo')
# => “zoom”

 "enhance".center(15)
 "enhance".rjust(11).ljust(15)
# => "    enhance    "

 "Stop! You’re under arrest!".upcase
 "Stop! You’re under arrest!".upcase!
# => "STOP! YOU’RE UNDER ARREST!"

 "the usual".insert(9, " suspects")
 "the usual" << " suspects"
 "the usual" + " suspects"
 "the usual".concat(32).concat(115).concat(117).concat(115).concat(112).concat(101).concat(99).concat(116).concat(115)
 "the usual".ljust(18, " suspects")
#=> "the usual suspects"

 " suspects".insert(0, "the usual")
 " suspects".rjust(18, "the usual")
# => "the usual suspects"

 "The case of the disappearing last letter".chop
 "The case of the disappearing last letter".chop!
 # => "The case of the disappearing last lette"

 "The mystery of the missing first letter".delete "T"
 "The mystery of the missing first letter".gsub(/[T]/, '')
 "The mystery of the missing first letter".gsub!(/[T]/, '')
 "The mystery of the missing first letter".sub(/[T]/, '')
 "The mystery of the missing first letter".sub!(/[T]/, '')
# => "he mystery of the missing first letter"

 "Elementary,    my   dear        Watson!".squeeze
 "Elementary,    my   dear        Watson!".squeeze!
 "Elementary,    my   dear        Watson!".split(' ').join(" ")
# => "Elementary, my dear Watson!"

 "z".ord # will change the string to the ASCII code
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

 "How many times does the letter 'a' appear in this string?".count "a"
 # => 4