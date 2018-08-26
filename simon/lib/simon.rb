class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      #round_success_message("success") unless @game_over == false
    end
    game_over_message("game over")
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message("success") if @game_over == false
    @sequence_length+=1
#    game_over_message("game over") if @game_over == true
  end

  def show_sequence
    add_random_color
  #  @sequence_length += 1
    @seq.each do |color|
      print "#{color} "
    end
    #@sequence_length+=1
  end

  def require_sequence
    puts "Enter sequence colors"
    input = gets.chomp
    @game_over = true unless input == @seq

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message(message)

  end

  def game_over_message(message)

  end

  def reset_game
    @seq = []
    @game_over = false
    @sequence_length = 1
  end
end
