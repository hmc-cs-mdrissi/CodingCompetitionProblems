#Use the cycle detection algorithm because if we view the array like a function from 0..n to to 1..n it can't be injective (pigeon hole),
#so the linked list representation of the function will have a cycle.

# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
    slow = 0
    fast = 0
    
    begin
        slow = nums[slow]
        fast = nums[nums[fast]]
    end while (slow != fast)
    
    find = 0
    
    while (find != slow)
        slow = nums[slow]
        find = nums[find]
    end
    
    find
end