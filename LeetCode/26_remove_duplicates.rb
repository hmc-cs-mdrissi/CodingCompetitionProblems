# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    return 0 if nums.length == 0
    
    current_unique_length = 1
    previous_value = nums[0]
    
    nums.each do |current_value|
        if current_value != previous_value
            nums[current_unique_length] = current_value
            previous_value = current_value
            current_unique_length += 1
        end
    end
    
    current_unique_length
end