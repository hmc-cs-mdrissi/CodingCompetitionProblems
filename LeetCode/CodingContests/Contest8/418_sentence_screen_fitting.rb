# @param {String[]} sentence
# @param {Integer} rows
# @param {Integer} cols
# @return {Integer}
def words_typing(sentence, rows, cols)
    word = 0
    col = 0
    total_cycles = 0
    rows_left_over = 0
    total_space_one_line = sentence.map {|word| word.length}.inject(:+) + sentence.length
    
    rows.times do |current_row|
        total_cycles += (cols + 1) / total_space_one_line
        col = ((cols + 1) / total_space_one_line) * total_space_one_line
        
        while(cols - col >= sentence[word].length)
            col += sentence[word].length + 1
            word += 1
            
            if word == sentence.length
                
                
                total_cycles += 1
                word = 0
            end
        end
        
        if col == (cols + 1) && word == 0
            col = 0
            number_of_rows = current_row + 1
            total_cycles *= rows/number_of_rows
            rows_left_over = rows % number_of_rows
            break
        end
        
        col = 0
    end
    
    
    
    rows_left_over.times do 
        while(cols - col >= sentence[word].length)
            col += sentence[word].length + 1
            word += 1
            
            if word == sentence.length
                total_cycles += 1
                word = 0
            end
        end
        
        col = 0
    end
    
    total_cycles
end