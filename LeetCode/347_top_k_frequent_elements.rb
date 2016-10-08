class Array
    include Comparable
    
    def second
        self[1]
    end

    def third
        self[2]
    end

    def fourth
        self[3]
    end

    def fifth
        self[4]
    end

    def sixth
        self[5]
    end

    def seventh
        self[6]
    end

    def eighth
        self[7]
    end

    def ninth
        self[8]
    end

    def tenth
        self[9]
    end
    
    def quick_select(position)
        return quick_select(position, &:<=>) unless block_given?
        
        current_start_collection = 0
        current_end_collection = size-1
    
        loop do
            #A pivot is chosen in the current slice of the collection.
            pivot_location = rand(current_start_collection..current_end_collection)
            pivot = self[pivot_location]
            
            #The array is partitioned and rearranged about the pivot
            partition_pieces = self[current_start_collection..current_end_collection].group_by {|current| yield(current, pivot)}    
            partition_pieces.default = []

            less_than_pivot = partition_pieces[-1]
            equal_to_pivot = partition_pieces[0]
            more_than_pivot = partition_pieces[1]
        
            self[current_start_collection..current_end_collection] = less_than_pivot + equal_to_pivot + more_than_pivot        

            #Now essentially recurse to the proper side.
            if(current_start_collection + less_than_pivot.size + equal_to_pivot.size <= position)
                current_start_collection += less_than_pivot.size + equal_to_pivot.size
            elsif(current_start_collection + less_than_pivot.size > position)
                current_end_collection = current_start_collection + less_than_pivot.size - 1
            else
                return pivot;
            end
        end
    end

    def quick_select_by(position, &compare_by)
        raise ArgumentError, <<-HEREDOC.lstrip! unless block_given?
            I need a block. If you want to use the default comparison for your elements use quick_select.
        HEREDOC
            
        map! {|element| [yield(element), element]}        

        current_start_collection = 0
        current_end_collection = size-1
               
        loop do
            #A pivot is chosen in the current slice of the collection. We only
            #need the first part of pivot because that stores the value to use for comparisons.
            pivot_location = rand(current_start_collection..current_end_collection)
            pivot = self[pivot_location].first
            
            #The array is partitioned and rearranged about the pivot
            partition_pieces = self[current_start_collection..current_end_collection].group_by do |compare_value, element|   
                compare_value <=> pivot
            end
            
            partition_pieces.default = []
            
            less_than_pivot = partition_pieces[-1]
            equal_to_pivot = partition_pieces[0]
            more_than_pivot = partition_pieces[1]
            
            self[current_start_collection..current_end_collection] = less_than_pivot + equal_to_pivot + more_than_pivot        

            #Now essentially recurse to the proper side.
            if(current_start_collection + less_than_pivot.size + equal_to_pivot.size <= position)
                current_start_collection += less_than_pivot.size + equal_to_pivot.size
            elsif(current_start_collection + less_than_pivot.size > position)
                current_end_collection = current_start_collection + less_than_pivot.size - 1
            else
                map! {|compare_value, element| element}
                return pivot
            end
        end
    end
end

module Enumerable
    def frequencies
        Hash.new(0).tap {|counting_hash| each {|current| counting_hash[current] += 1}}
    end
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    #Create an array of pairs describing the frequencies in nums. The first element in the pair is the frequency,
    #while the second element in the pair is the value.
    partially_sorted_frequencies = nums.frequencies.map(&:reverse)

    #Partition about the k most frequent element where more frequent elements come before
    #and less frequent elements come after. Then, just get the first k values.
    partially_sorted_frequencies.quick_select(k-1) {|first, second| second <=> first} 
    partially_sorted_frequencies[0...k].map(&:second)
end