class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black

    @white = white
    @black = black
  end

  def to_s
    Array.new(8) { Array.new(8) { "_" } }.
      tap do |board|
        board[white[0]][white[1]] = 'W'
        board[black[0]][black[1]] = 'B'
    end.
    map { |row| row.join(" ") }.
    join("\n")
  end

  def attack?
    on_horizontal? || on_vertical? || on_diagonal?
  end

  private

  def on_horizontal?
    white[0] == black[0]
  end

  def on_vertical?
    white[1] == black[1]
  end

  def on_diagonal?
    (white[1] - black[1]).abs == (white[0] - black[0]).abs
  end
end
