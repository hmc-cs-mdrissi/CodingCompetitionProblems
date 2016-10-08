# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    value_sum = a.to_i(2) + b.to_i(2)
    value_sum.to_s(2)
end