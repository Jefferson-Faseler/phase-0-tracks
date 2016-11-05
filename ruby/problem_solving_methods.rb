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

# make a starting array of 0 and 1
# add the two previous numbers and then put the sum in the array
# again add the two last numbers of the array and
# put sum on end of array
# continue until argument value is met

def fibonacci_finder(num)
  fib_arr = [ 0, 1]
  i = 2
  sum = 0
  while i < num
    sum = fib_arr[-1] + fib_arr[-2]
    fib_arr << sum
    i += 1
  end
  puts fib_arr.last
end

fibonacci_finder(100)


array = [1,7,8,4,9,3,9]

def insert(arr)
    sorted = [arr[0]]               # create sub-array of sorted elements
    arr.delete_at(0)                # deletes first value of array
    arr.each { |element|            # iterates through array for each element
        sort_index = 0              # sorting starts at first index
        while sort_index < sorted.length        # continues loop until finished
            if element <= sorted[sort_index] #compares element to sorted element
                # places unsorted element before sorted element
                sorted.insert(sort_index, element)
                break         # stops loop here and moves on to next element
            elsif sort_index == sorted.length - 1 #if element should sort to end
                sorted.insert(sort_index + 1, element) #inserts element after index
                break         # stops loop here and moves on to next element 
            end
            sort_index += 1   # increases the index by 1
        end
    }
    sorted                    #implicit return
end


print insert(array)