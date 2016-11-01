def colors
  puts "red, green, blue are three cool colors"
  yield("yellow")
end

colors { |another_color| puts "but so is #{another_color}"}