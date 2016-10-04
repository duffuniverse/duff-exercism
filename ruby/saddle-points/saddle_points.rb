class Matrix
  attr_reader :rows, :columns

  def initialize(string)
    @rows = string.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points
    rows.each_with_index.inject([]) do |memo, (row, row_index)|
      memo.concat(
        row.each_index.select { |i| row[i] == row.max }.
          map { |column_index| [row_index, column_index] } 
      )
    end &
    columns.each_with_index.inject([]) do |acc, (column, column_index)|
      acc.concat(
        column.each_index.select { |j| column[j] == column.min }.
          map { |row_index| [row_index, column_index] }
      )
    end  
  end
end
