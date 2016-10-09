class Solution {
public:
    string addStrings(string num1, string num2) {
        string result = "";
        int carry = 0;
        
        makeSameLength(num1,num2);
        
        for(int index = num1.length()-1; index >= 0; --index){
            int currentA = (int) (num1[index] - '0');
            int currentB = (int) (num2[index] - '0');
            
            int sum_current = currentA + currentB + carry;
            int new_digit = sum_current % 10;
            carry = sum_current / 10;
            
            result = to_string(new_digit) + result;
        }
        
        if(carry == 1){
            result = to_string(carry) + result;
        }
        
        return result;
    }
    
    void makeSameLength(string& a, string& b){
        if(a.length() > b.length()){
            for(size_t currentBlankSpace = a.length()-b.length(); currentBlankSpace > 0; --currentBlankSpace){
                b = "0" + b;
            }
        } else if (a.length() < b.length()){
            for(size_t currentBlankSpace = b.length()-a.length(); currentBlankSpace > 0; --currentBlankSpace){
                a = "0" + a;
            }
        }
    }
};