class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int result = 0;
        
        for(size_t index = 0; index < nums.size(); ++index){
            result ^= (index+1) ^ nums[index];
        }
        
        return result;
    }
};