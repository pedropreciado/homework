class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1, game_over = false, seq = [])
    @sequence_length = sequence_length
    @game_over = game_over
    @seq = seq
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    i = 0
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      sleep(1)
      p color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    guess = []
    puts "Enter sequence: "
    @seq.each do |color|
      guess = gets.chomp
      @game_over = true unless guess == color
    end
    true
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Nice. Next sequence: "
  end

  def game_over_message
    puts "Game over."
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
