class Solution {
public:
    bool isPowerOfFour(int num) {
        return num > 0 && ((num & (num - 1)) == 0) && (ffs(num) % 2 == 1);
    }
};