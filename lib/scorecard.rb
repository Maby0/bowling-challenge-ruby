class Scorecard
  attr_reader :spare_active, :player_name, :current_total_score, :current_frame, :all_turns, :each_frame_score

  STARTING_FRAME = 1
  MAX_FRAMES = 10
  TEN_PINS = 10
  
  def initialize(name)
    @player_name = name
    @current_frame = STARTING_FRAME
    @all_turns = {}
    @each_frame_score = []
    @spare_active = false
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
        @all_turns[:"f#{current_frame}"] = [gets.chomp.to_i]
      else
        @all_turns[:"f#{current_frame}"] << gets.chomp.to_i
      end
      @turn += 1
    end

    @frame_score = current_frame_turns.sum
    # @each_frame_score << @frame_score

    if @spare_active
      @each_frame_score << (TEN_PINS + current_frame_turns.first)
      @spare_active = false
    end

    if @frame_score == 10 && took_2_turns_this_frame?
      @spare_active = true
    else
      @each_frame_score << @frame_score
    end
    
    @current_total_score = @each_frame_score.sum
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

  def took_2_turns_this_frame?
    current_frame_turns.count == 2
  end

  def current_frame_turns
    @all_turns[:"f#{@current_frame}"]
  end
  # def update_current_score
  # end
end
