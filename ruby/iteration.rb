def colors
  puts "red, green, blue are three cool colors"
  yield("yellow", "black")
end

colors { |color1, color2 | puts "but so are #{color1} and #{color2}." }