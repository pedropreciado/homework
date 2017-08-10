class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    @cups.take(6).each do |el|
      4.times { el << :stone }
    end

    @cups[7..12].each do |el|
      4.times { el << :stone }
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos] == nil
    raise "Invalid starting cup" if @cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    i = start_pos
    until stones.empty?
      i += 1 % 14
      case i
      when 6
        @cups[6] << stones.shift if current_player_name == @name1
      when 13
        @cups[13] << stones.shift if current_player_name == @name2
      else
        @cups[i] << stones.shift
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[7..12].all? {|arr| arr.empty?}
    return true if @cups[0..6].all? {|arr| arr.empty?}
    false
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      return @name2
    when 0
      return :draw
    when 1
      return @name1
    end

  end
end
