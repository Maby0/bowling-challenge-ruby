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
      expect(@current_game.current_total_score).to eq 0
    end

    it 'starts at the first frame' do
      expect(@current_game.current_frame).to eq 1
    end

    it 'starts with an empty scorecard' do
      expect(@current_game.scorecard).to be_empty
    end
  end

  context 'playing the game' do
    context 'the first frame' do 
      let(:game) { described_class.new("Mabon") }

      it 'able to enter 2 different scores for the same frame and return your total score' do
        allow(game).to receive(:gets).and_return("3", "5")
        expect(game.insert_score).to eq 8
      end

      it 'stores the current score in current_total_score' do
        allow(game).to receive(:gets).and_return("3", "5")
        game.insert_score
        expect(game.current_total_score).to eq 8
      end

      it 'stores the frame score in scorecard hash' do
        allow(game).to receive(:gets).and_return("3", "5")
        game.insert_score
        expect(game.scorecard[:f1].first).to eq 3
        expect(game.scorecard[:f1].last).to eq 5
      end
    end

    context 'first and second frame' do
      let(:game) { described_class.new("Mabon")}

      it 'changes the current_frame to the next after first frame' do
        allow(game).to receive(:gets).and_return("3", "5")
        game.insert_score
        expect(game.current_frame).to eq 2
      end

      it 'sums the scores of the first and second frame' do
        allow(game).to receive(:gets).and_return("3", "5", "8", "1")
        game.insert_score
        game.insert_score
        expect(game.current_total_score).to eq 17
      end

      it 'stores the scores of all bowls across both frames' do
        allow(game).to receive(:gets).and_return("3", "5", "8", "1")
        game.insert_score
        game.insert_score
        expect(game.scorecard[:f1].first).to eq 3
        expect(game.scorecard[:f1].last).to eq 5
        expect(game.scorecard[:f2].first).to eq 8
        expect(game.scorecard[:f2].last).to eq 1
      end

      # context 'first frame is a spare' do
      #   it 'applies the spare bonus accordingly' do
      #     allow(game).to receive(:gets).and_return("5", "5", "2", "3")
      #     game.insert_score
      #     game.insert_score
      #     expect(game.scorecard[:f1]).to eq 5
      #     expect(game.scorecard[:f1]).to eq 5
      #     expect(game.scorecard[:f2]).to eq 8
      #     expect(game.scorecard[:f2]).to eq 1
      #   end
      # end
    end

    # context 'no more inputs once the 10th frame ends' do
    #   let(:game) { described_class.new("Mabon") }

    #   it 'stops requesting inputs once current_frame is greater than 10' do
    #     allow(game).to receive(:gets).and_return("3")
    #     expect(game.start_game).to eq "Game has ended"
    #   end
    # end
  end
end
