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
