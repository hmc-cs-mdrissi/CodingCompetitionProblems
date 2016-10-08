# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
    return 1 if n == 0
    return 1/my_pow(x,-n) if n < 0
    
    if n % 2 == 0 then my_pow(x*x,n/2) else x*my_pow(x*x,(n-1)/2) end
end