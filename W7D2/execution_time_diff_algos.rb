# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]



# def my_min(list)
#     acc = list.first

#     list.each do |ele1|
#         list.each do |ele2|
#             case acc <=> ele2 
#             when 1
#                 acc = ele2
#             end
#         end
#     end
#     acc 
# end



# p my_min(list)  # =>  -5

# def my_min2(arr)
#     smallest_num = nil

#     arr.each do |ele|
#         smallest_num = ele if smallest_num.nil?
#         smallest_num = ele if ele < smallest_num
#     end

#     smallest_num
# end

# p my_min2(list)  # =>  -5

# def largest_contiguous_subsum(array)
#     sub_arr = []

#     array.each_with_index do |ele1,i|
#         sub_arr << [ele1]
#         array.each_with_index do |ele2,j|   
#             if j > i 
#                 sub_arr << array[i..j]
#             end
#         end
#     end
#     sub_arr.max_by{|sub| sub.sum}.sum
# end

def quick_css(array)
    current = 0
    hash = Hash.new(0)
    array.each_with_index do |ele, i|
        if current + ele > 0
            hash[i] = current += ele
        else
            
    end
    hash
end

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]

# p largest_contiguous_subsum(list1)
# p largest_contiguous_subsum(list2)

p quick_css(list1)
p quick_css(list2)