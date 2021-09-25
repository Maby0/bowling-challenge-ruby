class Scorecard
  attr_reader :player_name, :current_score, :current_frame, :scorecard

  def initialize(name)
    @player_name = name
    @current_score = 0
    @current_frame = 1
    @scorecard = Hash.new
  end

  def insert_score
    # turn 1 or 2
    t = 1
    frame_score = 0
    while t < 3
      frame_score = frame_score + gets.chomp.to_i
      t += 1
    end
    frame_score
  end

  #def next_frame
  #end

  #def frame_score(first_bowl, second_bowl=0)
  #end

  #def spare
  #end

  #def strike
  #end
end
