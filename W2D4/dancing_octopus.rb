tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

#Slow Dance
def slow_dance(direction, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == direction
  end
  nil
end

p slow_dance("right-up", tiles_array)

tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}

#Constant Dance
def constant_dance(direction, tiles)
  tiles[direction]
end

p constant_dance("left", tiles_hash)
