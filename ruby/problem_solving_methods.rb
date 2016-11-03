# arr = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

# def take_array(array, integer)
#   index = 0
#   array.each do |i|
#     if i == integer
#       p index
#     else
#       index += 1
#     end
#   end  
# end

# take_array(arr, 3)

# # make a starting array of 0 and 1
# # add the two previous numbers and then put the sum in the array
# # again add the two last numbers of the array and 
# # put sum on end of array
# # continue until argument value is met

# def fibonacci_finder(num)
#   fib_arr = [ 0, 1]
#   i = 2
#   sum = 0
#   while i < num
#     sum = fib_arr[-1] + fib_arr[-2]
#     #DRIVER CODE# 
#     # puts "#{fib_arr[-2]} and #{fib_arr[-1]} make #{sum}" 
#     fib_arr << sum
#     i += 1
#   end
#   puts fib_arr.last
# end

# fibonacci_finder(100)


#Pseudocode Insertion
# array [46, 3, 75, 99, 55]
#Looking at first two elements
def sort()
#Compare first two elements.

#If first element is greater than second element move second element to first position

#if not elements stay in their current position.

#Compare third element to second element

#If third element is greater than second element move third element to second position

#If not elements stay in their current position.

#Repeat through element until the end.

