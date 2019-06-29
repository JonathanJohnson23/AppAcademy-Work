# 1. [3, 6, 1, 7, 9, 4, 10, 8, 2, 5]

# 2. [3, 6, 1, 7][4, 10, 8, 2, 5]

# 3. after its split sent to merge 

# 4. compare arrays organized acccordingly 

# 5.

def mergesort(array)
return array if array.length == 1

middle = array.length / 2    

sorted_left = array.take(middle)
sorted_right = array.drop(middle)
mergesort(sorted_left)
mergesort(sorted_right)
merge()

end


[3,2,1], [8, 7]
def merge(left, right)

    final_array = []


    until left.empty? || right.empty?
        #while !left.empty? && !right.empty?
        case left.last <=> right.last

        when -1 
            final_array << left.pop
        when 0
            final_array << right.pop
        when 1
            final_array << right.pop
        end
    end

    final_array.concat(left).concat(right)


end


# [1,2,3,4,5,6,7,8],  6

# arr.length == 8
# mid = arr.length/2 =>4
# midElement = arr[4]

# [5,6,7,8]  7, 6

# [5,6]  6,6
# return 1

# [5,6,7,8]  7, 9

# [7,8] ,9
# [8]
# [5,6]
# [5,6,7,8]
# [1,2,3,4,5,6,7,8],  6

# [5,6], 6
def binarySearch(arr, key)
    midIndex = arr.lengh / 2  #4 arr[1] == 6 
    
    if arr.length == 1 && arr[0] != key
        return nil
    end
    
    if arr[midIndex] == key
        return midIndex
    elsif arr[midIndex] > key   
        binarySearch(arr[0...midIndex],key)
    else   
        result = binarySearch(arr[midIndex..-1], key)
        if result.nil?
            return nil
        else
            return midIndex + 1 + result
        end
    end

end





# F(n) = F(n - 1) + F(n-2)

# 1,1

# 1,1,2,3,5,8,11....

# F(4) => 3


# def fib_seq(num)

# return 1 if num == 1
# return 1 if num == 2

# fib_seq(num - 1) + fib_seq(num - 2 )

# end

# class Array
#     def my_each(&prc)

#         prc ||= Proc.new{ |ele| ele}
#         arr = []
#         for i  in 0...self.length
#             arr << prc.call(self[i])
#         end
#         arr
#     end

# end


# [0,1,2,3,4,5,6,9] ,  14

# 5 + 9 == 14
# arr[5] + arr[7] == 14

# [5, 7]
# https://leetcode.com/problems/two-sum/

# def index_sum(array, key)
#     hash = Hash.new(0)
#     array.each_with_index do |number, idx|
#         needed_value = key - number

#         if hash.has_key?(number)
#             return [hash[needed_value], idx]
#         end
#             hash[needed_value] = idx
        
#     end
# end



# def two_sum(arr, key)
#     hash = {}

#     arr.each.with_index do |n, i|
#         if hash[key - n]
#             return hash[key - n], i
#         else
#             hash[n] = i
#         end
#     end
# end

# def palindrome_substrings(str)
#     subs = substrings(str)
#     subs.select{ |sub| sub.lengh > 1}
# end

# def substrings(str) # abc,    a,b,c ab,ac, bc, abc
#     ans = []
#     for i in 0...str.length
#         for j in i...str.length
#             ans << str[i..j]
#         end
#     end
#     ans
# end

# def palindrome?(str)
#     str == str.reverse
# end

# # Write a method that takes a string and an alphabet. It returns a copy of the string
# # with the letters re-ordered according to their positions in the alphabet. If
# # no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# # Example:
# # jumble_sort("hello") => "ehllo"
# # jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
# def jumble_sort(str, alphabet = nil)

#     alphabet ||= ("a".."z")to_a

#     new_str = ""

#     alphabet.each do |chars|
#         if str.include?(chars)
#             str.count(chars).times do 
#                 new_str += chars
#             end
#         end
#     end
#     new_str

# end


# Write a recursive method that returns all of the permutations of an array

# ex. permutations([1,2,3])
# should return => [

# ]
def permutations(array)
    return [array] if array.length == 1
    first = array.shift
    perms = permutations(array)
    total_permutations = []
    perms.each do |perm|
        p perm
        for i in 0..perm.length
            total_permutations << perm[0...i] + [first] + perm[i..-1]
        end
    end
    
    total_permutations
end
p permutations([1,2,3])

1, [2,3]

[], [1], [2,3]
[2], [1], [3]
[2,3],[1],[]