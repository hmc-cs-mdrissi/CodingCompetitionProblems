class Solution {
public:
    void sortColors(vector<int>& nums) {
        size_t locationOfFirst1 = 0;
        size_t locationOfFirst2 = 0;
        
        for(size_t index = 0; index < nums.size(); ++index){
            if(nums[index] == 0){
                swap(nums[index],nums[locationOfFirst1]);
                
                if(locationOfFirst1 != locationOfFirst2){
                    swap(nums[index],nums[locationOfFirst2]);
                }
                
                ++locationOfFirst1;
                ++locationOfFirst2;
            } else if(nums[index] == 1){
                swap(nums[index],nums[locationOfFirst2]);
                
                ++locationOfFirst2;
            }
        }
    }
};