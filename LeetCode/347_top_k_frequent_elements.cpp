class Solution {
public:
    static bool greaterPair(pair<int,int> firstPair, pair<int,int> secondPair){
        return firstPair.second > secondPair.second;
    }

    vector<int> topKFrequent(vector<int>& nums, int k) {
        unordered_map<int,int> frequencies;
        
        for(int current : nums){
            if(frequencies.count(current) == 1){
                ++frequencies[current];
            } else {
                frequencies.insert(std::pair<int,int>(current,1));
            }
        }
        
        vector<std::pair<int,int>> partiallySortedFrequencies(frequencies.begin(),frequencies.end());
        
        std::nth_element(partiallySortedFrequencies.begin(),partiallySortedFrequencies.begin()+(k-1),
                         partiallySortedFrequencies.end(), greaterPair);
        
        vector<int> result;
        
        for(std::pair<int,int> currentPair : partiallySortedFrequencies){
            result.push_back(currentPair.first);
            if(result.size() == k){
                break;
            }
        }
        
        return result;
    }
};