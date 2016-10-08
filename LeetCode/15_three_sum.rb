# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    solutions = Set.new
    numbers_with_index = Hash.new {|hash, key| hash[key] = []}
    
    nums.each_with_index do |value, index| 
        numbers_with_index[value] << index if numbers_with_index[value].size <= 2
    end
    
    nums.each_with_index do |first_value, first_index|
        (first_index+1 ... nums.size).each do |second_index|
            second_value = nums[second_index]
            third_indices = numbers_with_index[-first_value-second_value]
            
            unless (third_indices - [first_index, second_index]).empty?
                solutions << [first_value, second_value, -first_value-second_value].sort
            end
        end
    end
    
    solutions.to_a
end