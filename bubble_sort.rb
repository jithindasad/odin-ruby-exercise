# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort
#  methodology (using #sort would be pretty pointless, wouldn’t it?).

def bubble_sort(array)
    passes = array.length - 2
    passes.times do
        array.each_with_index do |value, index|
           break if array[index+1] == nil
           array[index],array[index+1] = array[index+1],array[index] if array[index+1] < array[index]
        end
    end
    array
end



sorted_array = bubble_sort [2,1,300,1,9,5,9,7]
p sorted_array

# create a similar method called #bubble_sort_by which sorts an array by accepting a block. Remember
# to use yield inside your method definition to accomplish this. The block will have two arguments that
# represent the two elements of the array that are currently being compared. The block’s return will
# be similar to the spaceship operator you learned about before: If the result of the block execution is negative,
# the element on the left is “smaller” than the element on the right. 0 means both elements are equal.
# A positive result means the left element is greater. Use the block’s return value to sort your array.
#  Test your method with the example below.

def bubble_sort_by(array)
    passes = array.length - 2
    passes.times do
        array.each_with_index do |value, index|
            array[index],array[index+1] = array[index+1],array[index] if yield(array[index], array[index+1]) == -1
        end
    end
    array
end


sorted_array = bubble_sort_by(["hi","hello","hey"]){ |left, right| left <=> right }
p sorted_array
