# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
    total_sum = nums.inject(:+)
   
    return false if total_sum % 2 == 1
   
    return subset_sum(nums, total_sum/2)
end

def subset_sum(nums, target_sum)
    possible_sums = Hash.new {|hash, key| key[1] == 0}
    
    1.upto(nums.length) do |row_index|
        
        1.upto(target_sum) do |column_index|
            possible_sums[[row_index, column_index]] = possible_sums[[row_index-1, column_index]]
            
            if nums[row_index-1] <= column_index
                possible_sums[[row_index, column_index]] = possible_sums[[row_index, column_index]] || possible_sums[[row_index - 1,column_index - nums[row_index - 1]]]
            end
        end
    end
    
    possible_sums[[nums.length, target_sum]]
end