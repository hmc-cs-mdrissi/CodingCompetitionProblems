# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    longest_found = 0
    previously_found_letters_locations = Hash.new(-1)
    
    first_letter = 0
    
    s.each_char.with_index do |letter, index|
        prior_location = previously_found_letters_locations[letter]
        first_letter = first_letter > prior_location ? first_letter : prior_location + 1
        
        current_length = index - first_letter + 1
        longest_found = longest_found > current_length ? longest_found : current_length
        
        previously_found_letters_locations[letter] = index
    end
    
    longest_found
end