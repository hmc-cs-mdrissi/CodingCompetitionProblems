# @param {Integer[][]} matrix
# @return {Integer[][]}
def pacific_atlantic(matrix)
    row_count = matrix.length
    
    return [] if row_count == 0
    
    column_count = matrix[0].length
    
    return [] if column_count == 0
    
    pacific_paths = Array.new(row_count) {Array.new(column_count, false)}
    atlantic_paths = Array.new(row_count) {Array.new(column_count, false)}
    
    pacific_paths[0] = Array.new(column_count, true)
    atlantic_paths[-1] = Array.new(column_count, true)
    
    pacific_paths.each do |row|
        row[0] = true
    end
    
    atlantic_paths.each do |row|
        row[-1] = true
    end
    
    matrix.length.times do |row_index|
        flood_like_fill_square(pacific_paths, row_index, 0, matrix)
    end
    
    matrix[0].length.times do |col_index|
        flood_like_fill_square(pacific_paths, 0, col_index, matrix)
    end
    
    matrix.length.times do |row_index|
        flood_like_fill_square(atlantic_paths, row_index, column_count-1, matrix)
    end
    
    matrix[0].length.times do |col_index|
        flood_like_fill_square(atlantic_paths, row_count-1, col_index, matrix)
    end
    
    solution = []
    
    row_count.times do |row_index|
        column_count.times do |column_index|
            if pacific_paths[row_index][column_index] and atlantic_paths[row_index][column_index]
                solution << [row_index, column_index]
            end
        end
    end
    
    solution
end

def flood_like_fill_square(paths, i, j, matrix)
    paths[i][j] = true
    
    #Going up
    if i > 0 && matrix[i-1][j] >= matrix[i][j]
        flood_like_fill_square(paths, i-1, j, matrix) unless paths[i-1][j]
    end
    
    #Going down
    if (i < (matrix.length - 1)) && matrix[i+1][j] >= matrix[i][j]
        flood_like_fill_square(paths, i+1, j, matrix) unless paths[i+1][j]
    end
    
    #Going left
    if j > 0 && matrix[i][j-1] >= matrix[i][j]
        flood_like_fill_square(paths, i, j-1, matrix) unless paths[i][j-1]
    end
    
    #Going right
    if (j < (matrix[0].length - 1)) && matrix[i][j+1] >= matrix[i][j]
        flood_like_fill_square(paths, i, j+1, matrix) unless paths[i][j+1]
    end
end