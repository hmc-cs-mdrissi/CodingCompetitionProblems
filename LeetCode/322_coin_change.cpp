class Solution {
public:
    int coinChange(vector<int>& coins, int amount) {
        vector<int> valuesUpToAmount(amount+1);
        
        valuesUpToAmount[0] = 0;
        
        for(size_t index = 1; index <= amount; ++index){
            valuesUpToAmount[index] = -1;
            
            for(auto iter = coins.begin(); iter != coins.end(); ++iter){
                if(index >= *iter && valuesUpToAmount[index-*iter] != -1){
                        valuesUpToAmount[index] = (valuesUpToAmount[index] == -1) ? 
                                                   1 + valuesUpToAmount[index-*iter] :
                                                   min(1 + valuesUpToAmount[index-*iter], valuesUpToAmount[index]);
                }
            }
        }
        
        return valuesUpToAmount[amount];
    }
};