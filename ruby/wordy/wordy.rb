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

    def without_question(text)
      text[8..-2]
    end

    def math_expression(text)
      OPERATORS.
        keys.
        reduce(without_question(text)) do |result, key| 
          result.gsub key, OPERATORS[key] 
        end
    end

    def chunks
      expression.split(' ')
    end

    def first_number
      chunks.first.to_i
    end

    def all_but_the_first
      chunks[1..-1]
    end

    def evaluate_expression
      all_but_the_first.
        each_slice(2).
        reduce(first_number) { |result, (op, arg)| result.send(op, arg.to_i) }
    end
end
