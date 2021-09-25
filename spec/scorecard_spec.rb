require 'scorecard'

describe Scorecard do
  context 'upon initialization' do
    before do
      @current_game = described_class.new("Mabon")
    end

    it 'has a player name' do
      expect(@current_game.player_name).to eq "Mabon"
    end

    it 'has a starting score of 0' do
      expect(@current_game.current_score).to eq 0
    end

    it 'starts at the first frame' do
      expect(@current_game.current_frame).to eq 1
    end

    # xit 'starts with an empty scorecard' do
    #   expect(@current_game.scorecard).to eq {}
    # end
  end

  context 'playing the game' do
    let(:game) { described_class.new("Mabon") }

    it 'able to enter your last bowl score and return your total score' do
      allow(game).to receive(:gets).and_return("4", "0")
      expect(game.insert_score).to eq 4
    end

    it 'able to enter 2 different scores for the same frame and return your total score' do
      allow(game).to receive(:gets).and_return("3", "5")
      expect(game.insert_score).to eq 8
    end

    it 'stores the current score in current_score' do
      allow(game).to receive(:gets).and_return("3", "5")
      game.insert_score
      expect(game.current_score).to eq 8
    end
  end
  

end
