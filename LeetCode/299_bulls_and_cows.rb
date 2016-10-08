# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
    possible_cows = Hash.new(0)
    
    total_cows = 0
    total_bulls = 0
    
    secret.each_char.each_with_index do |secret_character, index| 
        if guess[index] == secret_character
            total_bulls += 1
        else
            possible_cows[secret_character] += 1
        end
    end
    
    guess.each_char.each_with_index do |guess_character, index|
        if possible_cows[guess_character] != 0 and guess_character != secret[index]
            total_cows += 1
            possible_cows[guess_character] -= 1
        end
    end
    
    return "#{total_bulls}A#{total_cows}B"
end