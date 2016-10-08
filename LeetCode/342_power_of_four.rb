# @param {Integer} num
# @return {Boolean}
def is_power_of_four(num)
    /^10*$/ === num.to_s(4)
end