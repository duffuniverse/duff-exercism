class OCR
  BINARY_FONT = {
    " _ | ||_|   " => 0,
    "     |  |   " => 1,
    " _  _||_    " => 2,
    " _  _| _|   " => 3,
    "   |_|  |   " => 4,
    " _ |_  _|   " => 5,
    " _ |_ |_|   " => 6,
    " _   |  |   " => 7,
    " _ |_||_|   " => 8,
    " _ |_| _|   " => 9
  }.freeze

  def initialize(input)
    @text = input
  end

  def convert
    @converted_string ||= @text.
      split("\n").
      each_slice(4).
      map { |line| parse(line) }.
      join(",")
  end

  private

  def parse(line)
    line.
      map { |row| row.scan(/.{3}/) }.
      transpose.
      map(&:join).
      map { |str| BINARY_FONT.fetch(str, "?") }.
      join
  end
end
