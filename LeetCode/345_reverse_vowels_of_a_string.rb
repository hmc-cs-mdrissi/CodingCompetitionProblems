class String
    def reverse_set_of_characters(set)
        matched_character_locations = []
        
        each_char.with_index do |character, index|
            matched_character_locations << index if set.include?(character)
        end
        
        number_of_matched_characters = matched_character_locations.length
        
        (number_of_matched_characters/2).times do |array_index|
            front_index = matched_character_locations[array_index]
            back_index = matched_character_locations[number_of_matched_characters - array_index - 1]
            
            self[front_index], self[back_index] = self[back_index], self[front_index]
        end
        
        self
    end
end

# @param {String} s
# @return {String}
def reverse_vowels(s)
    vowels = Set.new %w(a e i o u A E I O U)
    s.reverse_set_of_characters(vowels)
end