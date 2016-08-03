class Game
  FRAMES_IN_GAME = 10
  PINS_COUNT = 10

  attr_reader :frames 

  def initialize
    @frames = []

    frames << Frame.new(next_frame_number)
  end

  def roll(pins)
    raise 'Pins must have a value from 0 to 10' unless can_roll?(pins)
    raise 'Should not be able to roll after game is over' unless current_frame

    current_frame.throw_ball(pins)
  end

  def score
    raise 'Score cannot be taken until the end of the game' unless end_of_game?

    frames.each_with_index.map { |frame, index| 
      frame.score(frames[index + 1], frames[index + 2]) 
    }.reduce(0, :+)
  end

  private

  def can_roll?(pins)
    (0..PINS_COUNT).include?(pins)
  end

  def current_frame
    return nil if end_of_game?

    frames << Frame.new(next_frame_number) if frames.last.completed? 
    frames.last
  end

  def end_of_game?
    frames.length == FRAMES_IN_GAME && frames.last.completed?
  end

  def next_frame_number
    frames.length + 1
  end
end

module Frame
  def self.new(number)
    case number
    when (1..Game::FRAMES_IN_GAME - 1) then Default
    else Last 
    end.new
  end

  class Default
    MAX_BALL_THROWS = 2

    attr_reader :ball_throws

    def initialize
      @ball_throws = []
    end

    def throw_ball(pins)
      raise 'Pin count exceeds pins on the lane' unless can_throw?(pins)

      ball_throws << pins
    end

    def score(next_frame, frame_after_next)
      if_strike do
        return knocked_down_pins_count + pins_knocked_down_in_next_two_throws(next_frame, frame_after_next)
      end.
      if_spare do
        return knocked_down_pins_count + (next_frame ? next_frame.ball_throws.first : 0)  
      end.
      if_open do 
        return knocked_down_pins_count 
      end
    end

    def completed?
      strike? || ball_throws.length == MAX_BALL_THROWS 
    end

    def if_open
      yield if open? 
      self
    end

    def if_strike
      yield if strike?
      self
    end

    def if_spare
      yield if spare?
      self
    end

    def knocked_down_pins_count
      ball_throws.reduce(0, :+)
    end

    def pins_down_in_two_throws
      ball_throws[0..1].reduce(0, :+)
    end

    private

    def can_throw?(pins)
      knocked_down_pins_count + pins <= Game::PINS_COUNT
    end

    def pins_knocked_down_in_next_two_throws(next_frame, frame_after_next)
      if next_frame
        next_frame.if_strike do
          return next_frame.pins_down_in_two_throws + (frame_after_next ? frame_after_next.ball_throws.first : 0)
        end
        return next_frame.pins_down_in_two_throws
      else
        0
      end
    end

    def open?
      knocked_down_pins_count < Game::PINS_COUNT
    end

    def spare?
      knocked_down_pins_count == Game::PINS_COUNT && !strike?
    end

    def strike?
      ball_throws.first == Game::PINS_COUNT
    end
  end

  class Last
    MAX_BALL_THROWS = 3

    attr_reader :ball_throws

    def initialize
      @ball_throws = []
    end

    def throw_ball(pins)
      raise 'Pin count exceeds pins on the lane' unless can_throw?(pins)

      ball_throws << pins
    end

    def score(next_frame = nil, frame_after_next = nil)
      knocked_down_pins_count 
    end

    def completed?
      !(ball_throws.length < 2 || player_get_fill_ball?)
    end

    def knocked_down_pins_count
      ball_throws.reduce(0, :+)
    end

    def pins_down_in_two_throws
      ball_throws[0..1].reduce(0, :+)
    end

    def if_strike
      yield if strike?
      self
    end

    private

    def strike?
      ball_throws.first == Game::PINS_COUNT
    end

    def player_get_fill_ball?
      ball_throws.length == 2 && pins_down_in_two_throws >= Game::PINS_COUNT
    end

    def can_throw?(pins)
      if ball_throws.length == 1 && !strike?
        return ball_throws.first + pins <= Game::PINS_COUNT
      elsif ball_throws.length == 2 && ball_throws[1] != Game::PINS_COUNT
        return ball_throws[1] + pins <= Game::PINS_COUNT
      end
      true
      # TODO
    end
  end
end

module BookKeeping
  VERSION = 1
end
