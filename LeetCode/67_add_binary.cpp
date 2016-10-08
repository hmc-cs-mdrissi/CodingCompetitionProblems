class Solution {
public:
    string addBinary(string a, string b) {
        string result = "";
        int carry = 0;
        
        makeSameLength(a,b);
        
        for(int index = a.length()-1; index >= 0; --index){
            int currentA = (a[index] == '1') ? 1 : 0;
            int currentB = (b[index] == '1') ? 1 : 0;
            
            int current = carry ^ currentA ^ currentB;
            carry = currentA ? (carry | currentB) : (carry & currentB);
            
            result = to_string(current) + result;
        }
        
        if(carry == 1){
            result = to_string(carry) + result;
        }
        
        return result;
    }
    
    void makeSameLength(string& a, string& b){
        if(a.length() > b.length()){
            for(size_t currentBlankSpace = a.length()-b.length(); currentBlankSpace > 0; --currentBlankSpace){
                b = " " + b;
            }
        } else if (a.length() < b.length()){
            for(size_t currentBlankSpace = b.length()-a.length(); currentBlankSpace > 0; --currentBlankSpace){
                a = " " + a;
            }
        }
    }
};