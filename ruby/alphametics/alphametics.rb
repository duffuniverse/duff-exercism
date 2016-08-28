class Alphametics
  def solve(input)
    initial_expression = clear(input)
    letters = uniq_letters(initial_expression)

    permutations(letters.size).each do |digits|
      dictionary = letters.zip(digits).to_h

      possible_solution = initial_expression.gsub(/[A-Z]/, dictionary)
      next if leading_digit_zero?(possible_solution)

      return dictionary if eval(possible_solution)
    end

    nil
  end

  private
    
  def clear(input)
    input.gsub(/ ?\^ ?/, '**')
  end

  def uniq_letters(string)
    string.scan(/[A-Z]/).uniq
  end

  def permutations(size)
    (0..9).to_a.permutation(size)
  end

  def leading_digit_zero?(string)
    string.scan(/\d+/).any? { |match| match.start_with?('0') }
  end
end

module BookKeeping
  VERSION = 2
end
