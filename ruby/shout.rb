module Shout
  def self.yell_angrily(words)
    words.upcase! + "!!!" + " :("
  end

  def self.yelling_happily(words)
    "YAY! " + words + "!!!" + " :D"
  end
end

anger = "Trump won the presidency"
puts Shout.yell_angrily(anger)
# ==> TRUMP WON THE PRESIDENCY!!! :(
happy = "I still embrace democracy (But I don't want to...)"
puts Shout.yelling_happily(happy)
# ==> YAY! I still embrace democracy (But I don't want to...)!!! :D