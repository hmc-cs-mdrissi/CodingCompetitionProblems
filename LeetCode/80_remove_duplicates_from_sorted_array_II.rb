# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    return 0 if nums.empty?
    
    previous_value = nums[0]
    number_of_times_previous_value_seen_upto2 = 0
    unique_twice_numbers_length = 0
    
    nums.each do |current_value|
       if previous_value == current_value &&  number_of_times_previous_value_seen_upto2 < 2
            nums[unique_twice_numbers_length] = current_value
            unique_twice_numbers_length += 1
            number_of_times_previous_value_seen_upto2 += 1
       elsif previous_value != current_value
            nums[unique_twice_numbers_length] = current_value
            unique_twice_numbers_length += 1
            previous_value = current_value
            number_of_times_previous_value_seen_upto2 = 1
        end
    end
    
    unique_twice_numbers_length
end