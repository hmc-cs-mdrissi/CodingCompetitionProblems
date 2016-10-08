# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
    return 0 if x == 0
    current_guess = x/2.to_f
    
    #This implements Newton's method to approximate the square root.
    until((x - current_guess**2).abs < 0.5)
        current_guess = (x/current_guess + current_guess)/2
    end
    
    current_guess.to_i
end