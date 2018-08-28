class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14){ [:stone,:stone,:stone,:stone] }
    @name1 = name1
    @name2 = name2
    place_stones

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[6] = []
    @cups[13] = []
    @cups.each_with_index {|el,idx|el = [:stone,:stone,:stone,:stone] unless idx == 6 or idx == 13}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14
    pos = 0
    if start_pos <=6
      pos = start_pos-1
    else
      pos = start_pos
    end
    raise "Starting cup is empty"
  end

  def make_move(start_pos, current_player_name)
    # temp = @cups[start_pos].length
    # count = 1
    # idx=1
    # @cups[start_pos] = []
    # until count > temp
    #   if current_player_name == player1
    #     idx+=1 if start_pos+idx == 13
    #   elsif current_player_name == player2
    #     idx+=1 if start_pos+idx == 6
    #   end
    #   @cups[(start_pos+idx)%14] << :stone
    #   count+=1
    #   idx+=1
    # end
    # render
    # idx-=1
    # ending_idx = start_pos + idx
    # next_turn(ending_idx)

    # empties cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    # distributes stones
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      # places stones in the correct current player's cups
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    idx = ending_cup_idx%14
    # helper method to determine what #make_move returns
    if @cups[idx].length == 1
      # ended on empty cup -- switches players' turns
      return :switch
    elsif idx == 6 || idx == 13
      # ended on store -- get to choose where to start again
      return :prompt
    else
      # ended on cup with stones in it -- automatically starts there
      return ending_cup_idx
    end
  end

  # def next_turn(ending_cup_idx)
  #   # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  #   idx = (ending_cup_idx)%14
  #   if @cups[idx].length == 1
  #     return :switch
  #   elsif @cups[idx] == 6 or @cups[idx] == 13
  #     return :prompt
  #   else
  #     return idx
  #   end
  # end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
   player1_count = @cups[6].count
   player2_count = @cups[13].count

   if player1_count == player2_count
     :draw
   else
     player1_count > player2_count ? @name1 : @name2
   end
  end
end
