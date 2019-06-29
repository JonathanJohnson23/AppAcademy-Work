require"byebug"
# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. 
# If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.


def range(first, last)
    return [first] if last <= first + 1

    arr = range(first, last - 1)

    arr << arr[0] + arr[-1]
end


# p range(1, 5)
# p range(1, 8)
# p range(1, 12)


# Exponentiation
# # recursion 1

def exp(b,n)
    return 1 if n < 1
    b * exp(b, n - 1)
end

# p exp(5, 2)
# p exp(10, 3)


# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# Deep dup
# The #dup method doesn't make a deep copy:

class Array

    def deep_dup
        new_array = []
        self.each do |ele|
            if !ele.is_a?(Array)
                new_array << ele
            else
                new_array << ele.deep_dup
            end
        end
        new_array 
    end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]


# Fibonacci
def fibonacci(number)
    return [1,1] if number <= 1
    arr = fibonacci(number - 1)
    arr << arr[-1] + arr[-2]

end

# p fibonacci(5)
# p fibonacci(6)
# p fibonacci(7)
# p fibonacci(8)



# Binary Search
# debugger
def bsearch(array, target)
    middle = array.length / 2
    if array.length == 1 && array[0] != target
        return nil
    end

    if array[middle] == target
        return middle
    elsif array[middle] > target
        bsearch(array[0...middle], target)
    else
        result = bsearch(array[middle+1..-1],target)
        if result.nil?
            nil
        else
            middle + 1 + result
        end
    end
end

# Make sure that these test cases are working:
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# Merge Sort
# Implement a method merge_sort that sorts an Array:
# debugger
def merge_sort(array)
    return array if array.length <= 1
    middle = array.count / 2

    sorted_left = merge_sort(array.take(middle))
    sorted_right = merge_sort(array.drop(middle))

    merge(sorted_left, sorted_right)

end

def merge(left, right)
    merged = []
    while !left.empty? && !right.empty?
        case left.first <=> right.first
        when -1 
            merged << left.shift
        when 0
            merged << left.shift
        when 1
            merged << right.shift
        end
    end
    merged.concat(left).concat(right)
end

# print merge_sort([6, 7, 9, 3, 10, 5, 1, 2, 8, 4, 0])

# Array Subsets
# Write a method subsets that will return all subsets of an array.

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:


# Permutations
# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]


def bubble_sort(array)
    return array if array.length < 2
    sorted = false

    while !sorted
        sorted = true

        (0...array.length - 1).each do |idx|
            if array[idx] > array[idx+1]
                array[idx], array[idx+1] = array[idx+1], array[idx]
                sorted = false
            end
        end
    end
    array
end


print bubble_sort([1])
print bubble_sort([1,2,3,4,5,6])
print bubble_sort([1,6,3,7,98,3,7,9])
print bubble_sort([1,4,2,5,7])