# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
    /^10*$/ === n.to_s(3)
end