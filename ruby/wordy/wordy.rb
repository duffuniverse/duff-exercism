class WordProblem
  OPERATORS = {
    'plus' => '+',
    'minus' => '-',
    'multiplied by' => '*',
    'divided by' => '/'
  }.freeze

  attr_reader :expression

  def initialize(text)
    @expression = math_expression(text)
  end

  def answer
    evaluate_expression
  rescue NoMethodError => e
    raise ArgumentError
  end

  private

    def math_expression(sentence)
      OPERATORS.
        keys.
        reduce(sentence[8..-2]) { |result, key| result.gsub key, OPERATORS[key] }
    end

    def chunks
      expression.split(' ')
    end

    def evaluate_expression
      result = chunks.first.to_i

      chunks[1..-1].
        each_slice(2) { |operator, argument| result = result.send(operator, argument.to_i) } 

      result
    end
end
