module Enumerable
    def my_each
        i = 0
        while i < self.length do
            yield(self[i])
            i+=1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.length do
            yield(self[i], i)
            i+=1
        end
    end

    def my_select
        selected_array = []
        self.my_each do |item|
            selected_array << item if yield(item)
        end
        selected_array
    end

    def my_all?
        arr = []
        self.my_each do |item|
            arr << item if yield(item)
        end
        self.length == arr.length ? true : false
    end

    def my_any?
        self.my_each do |item|
           return true if yield(item)
        end
        false
    end

    def my_none?
        self.my_each do |item|
           return false if yield(item)
        end
        true
    end

    def my_count(arg = 'nil')
        if arg == 'nil' && block_given?
            count = 0
            self.my_each do |item|
                count+=1 if yield(item)
            end
            count
        elsif arg == 'nil' && !block_given?
            self.length
        elsif arg != 'nil'
            count = 0
            self.my_each do |item|
                count+=1 if arg == item
            end
            count
        end
    end

    def my_map
        self_obj = self
        # if self is a range
        self_obj = self.to_a if self.is_a? Range
        mapped_array = []
        self_obj.my_each do |item|
            mapped_array << yield(item)
        end
        mapped_array
    end

    def my_inject(memo=self[0])
        self.my_each_with_index do |value, index|
          memo = yield(memo, value) if index > 0
        end
        return memo
    end
end



[1,2,3,4,"hello"].my_each do |x|
    p x
end
puts "--------------------------"
puts "my_each_with_index"

[1,2,3,4,"hello"].my_each_with_index do |value, index|
    puts "#{value} => #{index}"
end

puts "--------------------------"
puts "my_select"

results = [1,2,3,4,5].my_select { |x| x < 3 }
puts results

puts "--------------------------"
puts "my_all?"

puts ["cat", "dog", "hen"].my_all? { |x| x.length >=3 }
puts ["cat", "dog", "he"].my_all? { |x| x.length >=3 }

puts "--------------------------"
puts "my_any??"

puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
puts %w[ant bear cat].my_any? { |word| word.length >= 5 }

puts "--------------------------"
puts "my_none?"

puts %w{ant bear cat}.none? { |word| word.length == 5 }
puts %w{ant bear cat}.none? { |word| word.length >= 4 }

puts "--------------------------"
puts "my_count"

ary = [1, 2, 4, 2]
puts ary.my_count                #=> 4
puts ary.my_count(2)            #=> 2
puts ary.my_count{ |x| x%2==0 } #=> 3

puts "--------------------------"
puts "my_map"

p (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
p (1..4).my_map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]

puts "--------------------------"
puts "my_inject"

longest = %w{ cat sheep bear }.my_inject do |memo, word|
    memo.length > word.length ? memo : word
 end

 puts longest
