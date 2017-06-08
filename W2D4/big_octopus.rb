require 'byebug'

FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#Sluggish Octopus
def sluggish_octopus(fishes)
  (0..fishes.length - 1).each do |idx1|
    biggest_fish = true
    (idx1 + 1...fishes.length).each do |idx2|
      biggest_fish = false if fishes[idx2].length > fishes[idx1].length
    end
    return fishes[idx1] if biggest_fish
  end
  nil
end

p sluggish_octopus(FISHES)

#Dominant Octopus
class Array
  def dominant_octopus(&prc)
    prc ||= Proc.new { |el1, el2| el1.length <=> el2.length }

    return self if self.length <= 1
    mid_point = length / 2
    sorted_left = take(mid_point).dominant_octopus(&prc)
    sorted_right = drop(mid_point).dominant_octopus(&prc)
    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged_arr = []
    until left.empty? || right.empty?
      case prc.call(left, right)
      when -1
        merged_arr << left.shift
      when 0
        merged_arr << left.shift
      when 1
        merged_arr << right.shift
      end
    end
    merged_arr + left + right
  end

end

p FISHES.dominant_octopus.last

#Clever Octopus
def clever_octopus(fishes)
  biggest_fish = fishes.first
  fishes.each { |fish| biggest_fish = fish if fish.length > biggest_fish.length }
  biggest_fish
end

p clever_octopus(FISHES)
