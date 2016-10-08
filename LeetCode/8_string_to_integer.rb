# @param {String} str
# @return {Integer}
def my_atoi(str)
    str.to_i > 2**31-1 ? 2**31-1 : str.to_i < -2**31 ? -2**31 : str.to_i;
end