# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
    intersection_set = nums1.to_set & nums2.to_set
    intersection_set.to_a
end