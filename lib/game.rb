require_relative 'opponent_decider'
class Game
 def initialize(opponent_decider)
  @opponent_decider = opponent_decider
 end

  def play(move)
    opponent_move = @opponent_decider.opponent_move
    if move == opponent_move
      return "It's a tie!", opponent_move
    elsif move == :rock && opponent_move == :scissors || move == :scissors && opponent_move == :paper ||
      move == :paper && opponent_move == :rock
      return "You won!", opponent_move
    else  
      return "You lose!", opponent_move
    end 
  end
end