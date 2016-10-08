# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    result = 0
    (0...nums.length).each do |current| 
        result ^= (current+1) ^ nums[current]
    end
    result
end