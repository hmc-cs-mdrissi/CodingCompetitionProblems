# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
    return 1 if n == 0
    (1..n).map {|current| n_digit_unique_strings(current)}.inject(:+)
end

def n_digit_unique_strings(n)
   return 10 if n == 1
   return 0 if n > 10
   
   9 * 9.downto(9 - n + 2).inject(:*)
end