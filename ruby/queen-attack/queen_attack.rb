class Queens
  DEFAULT_POSITIONS = {
    white: [0, 3],
    black: [7, 3]
  }.freeze

  BOARD_SIZE = 8

  def initialize(positions = nil)
    @positions = positions || DEFAULT_POSITIONS
    raise ArgumentError if white == black
  end

  def to_s
    (0...BOARD_SIZE).to_a.
      repeated_permutation(2).
      inject([]) { |board, position| board << piece(position) }.
      each_slice(BOARD_SIZE).
      inject([]) { |result, batch| result << batch.join(" ") }.
      join("\n")
  end

  def attack?
    on_same_horizontal? || on_same_vertical? || on_same_diagonal?
  end

  DEFAULT_POSITIONS.keys.each do |queen_color|
    define_method(queen_color) { @positions[queen_color] }
  end

  private

  def piece(position)
    case position
    when white then "W"
    when black then "B"
    else
      "_"
    end
  end

  def on_same_horizontal?
    white[0] == black[0]
  end

  def on_same_vertical?
    white[1] == black[1]
  end

  def on_same_diagonal?
    (white[1] - black[1]).abs == (white[0] - black[0]).abs
  end
end
