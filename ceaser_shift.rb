# Implement a caesar cipher that takes in a string and the shift factor
# and then outputs the modified string:
#
#   caesar_cipher("What a string!", 5)
#   => "Bmfy f xywnsl!"
#

def ceaser_cipher(string, number)
    string_array = string.split(//)
    alphabets = ("a".."z").to_a
    upper_alphabets = ("A".."Z").to_a
    final_array = []

    string_array.each do |char|
        if char.match(/[a-z]/)
            char_index = alphabets.index char
            char_index += number
            if char_index >= 26
                char_index -= 26
            end
            final_array = final_array << alphabets[char_index]
        elsif char.match(/[A-Z]/)
            char_index = upper_alphabets.index char
            char_index += number
            if char_index >= 26
                char_index -= 26
            end
            final_array = final_array << upper_alphabets[char_index]
        else
            final_array = final_array << char
        end
    end

    shifted_string = final_array.join
    puts shifted_string
end

ceaser_cipher("What a string!", 5)
