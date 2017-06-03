class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    puts "Welcome to Simon. Lets play!"
    puts "Keep the order of the colors shown in mind."
    sleep(4)
    system("clear")
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(1.25)
      system("clear")
      sleep(0.35)
    end
  end

  def require_sequence
    puts "Enter your sequence seperated by new lines:"
    sequence_length.times do |idx|
      guess = gets.chomp
      if guess != seq[idx]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    puts "Nice work! Lets continue."
    sleep(2)
  end

  def game_over_message
    puts "Whoops! Looks like you could go for #{seq.length} turns. Lets go again!"
  end

  def reset_game
    initialize
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
