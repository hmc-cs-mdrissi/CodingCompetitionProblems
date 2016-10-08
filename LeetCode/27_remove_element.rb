# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
   current_end = nums.size-1
   current_index = 0
   
   while (current_index <= current_end)
        if nums[current_index] == val
            nums[current_index], nums[current_end] = nums[current_end], nums[current_index]
            current_end -= 1
        else
            current_index += 1
        end
   end
   
   current_end+1
end