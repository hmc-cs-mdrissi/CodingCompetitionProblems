class Solution {
public:
    string getHint(string secret, string guess) {
        int possibleCows[10] = {0,0,0,0,0,0,0,0,0,0};
        int cows = 0;
        int bulls = 0;
        
        for(size_t index = 0; index < secret.length(); ++index){
            if(secret[index] == guess[index]){
                ++bulls;
            } else {
                ++possibleCows[secret[index] - '0'];
            }
        }
        
        for(size_t index = 0; index < secret.length(); ++index){
            if(secret[index] != guess[index] and possibleCows[guess[index] - '0'] > 0){
                ++cows;
                --possibleCows[guess[index] - '0'];
            }
        }
        
        return to_string(bulls) + "A" + to_string(cows) + "B";
        
    }
};