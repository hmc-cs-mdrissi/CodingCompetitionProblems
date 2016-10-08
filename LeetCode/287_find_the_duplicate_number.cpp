class Solution {
public:
    //One way to view this problem is finding the cycle if you follow the indices.
    //The start of the cycle will be the repeated element.
    int findDuplicate(vector<int>& nums) {
        size_t slow = 0;
        size_t fast = 0;
        
        do{
            slow = nums[slow];
            fast = nums[nums[fast]];
        } while (slow != fast);
        
        size_t finder = 0;
        
        while(slow != finder){
            slow = nums[slow];
            finder = nums[finder];
        }
        
        return finder;
    }
};