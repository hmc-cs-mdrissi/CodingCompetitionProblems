# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
   current_start = 0
   current_end = nums.size-1
   current_mid = (current_start+current_end)/2
   
   until is_peak?(nums, current_mid)
        if(current_mid > 0 && nums[current_mid] <= nums[current_mid-1])
            current_end = current_mid - 1
        else
            current_start = current_mid + 1
        end
        
        current_mid = (current_start+current_end)/2
   end
   
   current_mid
end

def is_peak?(nums, potential_peak)
    (potential_peak == 0 || nums[potential_peak] > nums[potential_peak - 1]) &&
    (potential_peak == nums.size-1 || nums[potential_peak] > nums[potential_peak + 1])
end