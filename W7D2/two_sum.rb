def bad_two_sum?(array, target)
    array.each_with_index do |ele, idx|
        array.each_with_index do |ele2, jdx|
            if jdx > idx
                return true if ele + ele2 == target
            end
        end
    end
    false
end

arr = [0, 1, 5, 7]

p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def binary_search(array, target)
    middle = array.length / 2 
    return nil if array.length == 1 && middle != target

    if array[middle] == target
        return middle
    elsif array[middle] > target
        binary_search(array[0...middle],target)
    else
        result = binary_search(array[middle..-1], target)
        if result.nil?
            nil
        else
            middle + result + 1
        end
    end
end


def okay_two_sum?(arr, target)
    arr.each do |ele|
        needed_num = ele - target
        if !binary_search(arr,needed_num).nil?
            return true
        end
    end
    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false


def best_two_sum?(array, target)
    hash = Hash.new(0)

    array.each_with_index do |ele, i|
        needed_num = target - ele
        if hash.has_key?(needed_num)
            return true
        else
            hash[ele] = i
        end
    end
    false
end

arr = [0, 1, 5, 7]

p best_two_sum?(arr, 6) # => should be true
p best_two_sum?(arr, 10) # => should be false