# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    prior_number_locations = {}
    
    nums.each_with_index do |number, index|
        if prior_number_locations.include?(target-number)
            return [prior_number_locations[target-number], index]
        else
            prior_number_locations[number] = index
        end
    end
    
    return []
end