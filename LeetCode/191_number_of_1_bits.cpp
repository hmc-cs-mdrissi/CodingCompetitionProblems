class Solution {
public:
    int hammingWeight(uint32_t i) {
        //A solution that doesn't just use a standard c++
        //function could be done recursively by modding 
        //and dividing by 2 as needed. You can also do
        //fancy bitwise arithmetic if you just want to have
        //fun.
        return __builtin_popcount(i);
    }
};