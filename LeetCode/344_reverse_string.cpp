class Solution {
public:
    string reverseString(string s) {
        string result = "";
        
        for(auto iter = s.rbegin(); iter != s.rend(); ++iter){
            result += *iter;
        }
        
        return result;
    }
};