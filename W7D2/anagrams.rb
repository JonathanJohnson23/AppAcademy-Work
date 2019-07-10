def first_anagram?(string, other_str)
    length = string.length
    str_arr = string.split("")

    perms = str_arr.permutation(length).to_a

    perms = perms.map { |perm| perm.join("") }.flatten

    perms.include?(other_str)
end

puts first_anagram?("gizmo", "sally")    #=> false
puts first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1 = str1.split("")
    str2 = str2.split("")
    str1.each do |char|
        if str2.include?(char)
            idx = str2.index(char)
            str2.delete_at(idx)
        else
            return false
        end

    end
    str2.empty?
end

puts second_anagram?("gizmo", "sally")    #=> false
puts second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    str1 = str1.split("").sort!
    str2 = str2.split("").sort!
    
    str1 == str2

end

puts third_anagram?("gizmo", "sally")    #=> false
puts third_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str1, str2)
    char_hash = Hash.new(0)

    str1.each_char { |char| char_hash[char] += 1 }
    str2.each_char { |char| char_hash[char] -= 1 }

    char_hash.values.all? { |val| val.zero? }
end



puts fourth_anagram?("gizmo", "sally")    #=> false
puts fourth_anagram?("elvis", "lives")    #=> true