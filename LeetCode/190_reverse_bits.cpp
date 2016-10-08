class Solution {
public:
    array<uint32_t,16> reverse4 = {{0,8,4,12,2,10,6,14,1,9,5,13,3,11,7,15}};

    uint32_t reverseBits(uint32_t n) {
        uint32_t first8 = n & 255;
        uint32_t second8 = (n >> 8) & 255;
        uint32_t third8 = (n >> 16) & 255;
        uint32_t last8 = (n >> 24) & 255;
        
        return (reverse8(first8) << 24) + (reverse8(second8) << 16) + (reverse8(third8) << 8) + reverse8(last8);
    }
    
    inline uint32_t reverse8(uint32_t number){
        return (reverse4[number & 15] << 4) + reverse4[(number >> 4) & 15];
    }
};