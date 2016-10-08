class Solution {
public:
    string reverseVowels(string s) {
        unordered_set<char> vowels = {'a','e','i','o','u',
                                      'A','E','I','O','U'};
        
        stack<char> vowelsInString;
        queue<size_t> locationOfVowelsInString;
        
        for(size_t index = 0; index < s.length(); ++index){
            char current = s[index];
            
            if(vowels.count(current) == 1){
                locationOfVowelsInString.push(index);
                vowelsInString.push(current);
            }
        }
        
        while(!vowelsInString.empty()){
            s[locationOfVowelsInString.front()] = vowelsInString.top();
            
            locationOfVowelsInString.pop();
            vowelsInString.pop();
        }
        
        return s;
    }
};