class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups[0..5].each { |cup| 4.times { cup << :stone } }
    cups[7..12].each { |cup| 4.times { cup << :stone } }
  end

  def valid_move?(start_pos)
    range = (0..12)
    raise "Invalid starting cup" if !range.include?(start_pos) || cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    opponent_pos = current_player_name == @name1 ? 13 : 6
    available_stones = cups[start_pos]
    cup_pos = start_pos
    until available_stones.empty?
      cup_pos += 1
      next if cup_pos == opponent_pos
      cup_pos = 0 if cup_pos > 13
      cups[cup_pos] << available_stones.pop
    end
    render
    next_turn(cup_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? { |cup| cup.empty? } || cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_stones = cups[6].length
    player2_stones = cups[13].length
    return :draw if player1_stones == 6 && player2_stones == 6
    return @name1 if player1_stones == 6
    return @name2 if player2_stones == 6
  end
end
