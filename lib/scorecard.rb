class Scorecard
  attr_reader :spare_active, :player_name, :current_total_score, :current_frame, :all_turns, :each_frame_score

  STARTING_FRAME = 1
  MAX_FRAMES = 10
  TEN_PINS = 10
  STRIKE = 10
  
  def initialize(name)
    @player_name = name
    @current_frame = STARTING_FRAME
    @all_turns = {}
    @each_frame_score = []
    @spare_active = false
    @strike_active = false
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
        if @all_turns[:"f#{current_frame}"].first == STRIKE
          break
        end
      else
        @all_turns[:"f#{current_frame}"] << gets.chomp.to_i
      end
      @turn += 1
    end

    @frame_score = current_frame_turns.sum

    if @strike_active
      @each_frame_score << (TEN_PINS + current_frame_turns.sum)
      @strike_active = false
    elsif @spare_active
      @each_frame_score << (TEN_PINS + current_frame_turns.first)
      @spare_active = false
    end

    if @frame_score == TEN_PINS && took_1_turn_this_frame?
      @strike_active = true
    elsif @frame_score == TEN_PINS && took_2_turns_this_frame?
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

  def current_frame_turns
    @all_turns[:"f#{@current_frame}"]
  end

  def took_1_turn_this_frame?
    current_frame_turns.count == 1
  end

  def took_2_turns_this_frame?
    current_frame_turns.count == 2
  end
end
