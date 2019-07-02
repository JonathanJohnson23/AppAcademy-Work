class Map
    attr_reader :my_map

    def initialize()
        @my_map = []
    end

    def set(key,value)
        if @my_map.any? {|arr| arr[0] == key}
            puts "Sorry!!!!!! THAT KEY EXISTS"
            return false
        else
            puts "your Key, value pair was added"
            my_map << [key,value]
        end
    end

    def get(key)
        @my_map.each do |arr|
            if arr.first == key
                return arr
            end
        end
    end
    
    def my_delete(key)
        @my_map.each_with_index do |arr, idx|
            if arr.first == key
                @my_map.delete(arr)
            end
        end
    end

    def show
        return @my_map
    end
    
   
    
    
end