arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octo(array)
    big_fish = ""
    array.each do |ele|
        array.each do |ele2|
            big_fish = ele2 if ele2.length > big_fish.length
        end
    end
    big_fish
end

p sluggish_octo(arr)

class Array

    def merge_sort(&prc)
        return self if length <= 1
        prc ||= Proc.new { |a, b| a <=> b }

        middle = self.length / 2
        left = self.take(middle)
        right = self.drop(middle)

        sorted_left = left.merge_sort(&prc)
        sorted_right = right.merge_sort(&prc)

        Array.merge(sorted_left, sorted_right, &prc)
    end

    def self.merge(left_half, right_half, &prc)
        merged = []

        until left_half.empty? || right_half.empty?
            if prc.call(left_half.first, right_half.first) == -1
                merged << left_half.shift
            else
                merged << right_half.shift
            end
        end

        merged + left_half + right_half
    end

end

def nlogn_biggest_fish(arr)
  prc = Proc.new { |a, b| a.length <=> b.length }
  new_arr = arr.merge_sort(&prc)
  p new_arr
  new_arr.last
end

p nlogn_biggest_fish(arr)

def clever_octo(arr)
    big_fish = ""
    arr.each do |ele|
        big_fish = ele if ele.length > big_fish.length
    end
    big_fish
end

p clever_octo(arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }

def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)