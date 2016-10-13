# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
    return 0 if x == 0
    current_guess = x/2.to_f
    
    #This finds the average of the current_guess and x/current_guess
    #to get closer to the actual answer.
    until((x - current_guess**2).abs < 0.5)
        current_guess = (x/current_guess + current_guess)/2
    end
    
    current_guess.to_i
end
