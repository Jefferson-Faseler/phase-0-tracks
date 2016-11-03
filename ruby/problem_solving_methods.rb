arr = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

def take_array(array, integer)
  index = 0
  array.each do |i|
    if i == integer
      p index
    else
      index += 1
    end
  end  
end

take_array(arr, 3)