class OpponentDecider

  def initialize
    @possible_moves = [:rock, :paper, :scissors]
  end

  def opponent_move
    opponent_move = @possible_moves.sample
  end
end