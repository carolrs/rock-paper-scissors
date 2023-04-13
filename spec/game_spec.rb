require 'game'

describe Game do 
  context ".play" do
    it "returns 'You won!' when move is rock versus scissors"do 
      opponent_fake = double :fake, opponent_move: :scissors
      move = Game.new(opponent_fake)
      expect(move.play(:rock)).to eq('You won!')
    end

    it "returns 'You won!' when move is paper versus rock"do 
    opponent_fake = double :fake, opponent_move: :rock
    move = Game.new(opponent_fake)      
    expect(move.play(:paper)).to eq('You won!')
    end

    it "returns 'You won!' when move is scissors versus paper"do 
    opponent_fake = double :fake, opponent_move: :paper
    move = Game.new(opponent_fake)      
    expect(move.play(:scissors)).to eq('You won!')
    end

    it "returns 'You lose!' when move is paper versus scissors"do 
    opponent_fake = double :fake, opponent_move: :scissors
    move = Game.new(opponent_fake)      
    expect(move.play(:paper)).to eq('You lose!')
    end

    it "returns 'You lose!' when move is scissors versus rock"do 
    opponent_fake = double :fake, opponent_move: :rock
    move = Game.new(opponent_fake)      
    expect(move.play(:scissors)).to eq('You lose!')
    end

    it "returns 'You lose!' when move is rock versus paper"do 
    opponent_fake = double :fake, opponent_move: :paper
    move = Game.new(opponent_fake)      
    expect(move.play(:rock)).to eq('You lose!')
    end

    it "returns 'It's a tie!' when move is rock versus rock"do 
    opponent_fake = double :fake, opponent_move: :rock
    move = Game.new(opponent_fake)      
    expect(move.play(:rock)).to eq("It's a tie!")
    end
  end
end