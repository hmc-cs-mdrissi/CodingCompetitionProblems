# @param {Integer} x
# @return {Integer}
def reverse(x)
    reversed = ((x < 0 ? "-" : "") + x.to_s.reverse).to_i
    reversed > 2**31-1 || reversed < -2**31+1 ? 0 : reversed
end