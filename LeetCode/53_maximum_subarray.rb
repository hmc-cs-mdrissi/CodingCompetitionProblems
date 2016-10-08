# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    #default max is just the first element in the array.
    #Keeps track of current max sum either containing the current element we are looking
    #at or no elements if the sum would become negative with it.
    max = current_sum = nums[0]
    
    #Kadane's algorithm which essentially is a use it or lose it strategy with dynammic programming.
    #The use it/lose it refers to whether you use the current element and it finds the max subarray
    #for the array from the beginning up to the current element.
    nums.drop(1).each do |element|
        current_sum += element
        current_sum = current_sum > element ? current_sum : element
        
        max = current_sum > max ? current_sum : max
    end
    
    max
end