class Scorecard
  attr_reader :player_name, :current_total_score, :current_frame, :scorecard

  MAX_FRAMES = 10

  def initialize(name)
    @player_name = name
    @current_total_score = 0
    @scorecard = {}
    @current_frame = 1
  end

  # def start_game
  #   @current_frame = 1
  #   while @current_frame <= MAX_FRAMES
  #     insert_score
  #     puts @frame_score
  #     next_frame
  #   end
  #   "Game has ended"
  # end

  def insert_score
    @turn = 1
    while @turn < 3
      if @turn == 1 
        @scorecard[:"f#{current_frame}"] = [gets.chomp.to_i]
      else
        @scorecard[:"f#{current_frame}"] << gets.chomp.to_i
      end
      @turn += 1
    end
    @current_total_score = @scorecard.values.flatten.sum
    @frame_score = @scorecard[:"f#{@current_frame}"].sum
    next_frame
    @frame_score
  end

  #def spare
  #end

  #def strike
  #end
  private

  def next_frame
    @current_frame += 1
  end
end
