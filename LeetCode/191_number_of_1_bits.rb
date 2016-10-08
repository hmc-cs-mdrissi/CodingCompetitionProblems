# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
    n.to_s(2).each_char.count("1")
end