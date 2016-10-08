class Solution {
public:
    vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {
        unordered_set<int> first(nums1.begin(),nums1.end());
        unordered_set<int> result;
        
        for (int i : nums2){
            if(first.count(i) == 1){
                result.insert(i);
            }
        }
        
        return vector<int>(result.begin(),result.end());
    }
};