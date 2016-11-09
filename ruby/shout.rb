# module Shout
#   def self.yell_angrily(words)
#     words.upcase! + "!!!" + " :("
#   end

#   def self.yelling_happily(words)
#     "YAY! " + words + "!!!" + " :D"
#   end
# end

# anger = "Trump won the presidency"
# puts Shout.yell_angrily(anger)
# # ==> TRUMP WON THE PRESIDENCY!!! :(
# happy = "I still embrace democracy (But I don't want to...)"
# puts Shout.yelling_happily(happy)
# # ==> YAY! I still embrace democracy (But I don't want to...)!!! :D

module Shout
  def yell(words)
    puts words.upcase! + "!!!"
  end
end

class New_yorker
  include Shout
end

class Drunk_person
  include Shout
end

## DRIVER CODE ##
party_boy = Drunk_person.new
mom_from_queens = New_yorker.new

party_boy.yell("I love yooouuuuu maaaaaaan")
## ==> I LOVE YOOOUUUUU MAAAAAAAN!!!
mom_from_queens.yell("Hey! I'm walkin' here")
## ==> HEY! I'M WALKIN' HERE!!!