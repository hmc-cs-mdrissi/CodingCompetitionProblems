#This solution is fast enough although I find it pretty ugly. Using more functional techniques like map and select made it a bit under
#time limit
def coin_change(coins, amount)
    coins_needed = Array.new(amount+1)
    coins_needed[0] = 0
    
    1.upto(amount) do |current_amount|
        minimum_coins_needed = amount+1
        
        coins.each do |coin_value|
            if current_amount >= coin_value and coins_needed[current_amount-coin_value] != -1 and minimum_coins_needed > coins_needed[current_amount-coin_value]
                minimum_coins_needed = 1+coins_needed[current_amount-coin_value]
            end
        end
        
        coins_needed[current_amount] = minimum_coins_needed == amount+1 ? -1 : minimum_coins_needed
    end
    
    coins_needed[amount]
end

#Slower, but more elegant
def coin_change2(coins, amount)
    coins_needed = Hash.new do |hash, key|
        coins_needed_after_one = coins.select {|coin_value| coin_value <= key}.map {|coin_value| hash[key-coin_value]}
                        .reject {|coins_needed| coins_needed == -1}.min
        hash[key] = if coins_needed_after_one == nil then -1 else 1 + coins_needed_after_one end
    end.update(0 => 0)
    
    #This is just to prevent stack overflow. If you tried to directly calculate amount you might have too many calls down.
    (1..amount).each {|current| coins_needed[current]}
    
    coins_needed[amount]