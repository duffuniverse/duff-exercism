require 'ostruct'

class Palindromes
  attr_reader :max_factor, :min_factor, :palindromes

  def initialize(options)
    @max_factor = options.fetch(:max_factor, 99)
    @min_factor = options.fetch(:min_factor, 1)
    @palindromes = {}
  end

  def generate
    (min_factor..max_factor).to_a.each { |n| detect_palindrome_products(n) }
  end

  def largest
    palindromes[max_key]
  end

  def smallest
    palindromes[min_key]
  end

  private

  def detect_palindrome_products(factor)
    (min_factor..factor).to_a.each do |other_factor|
      product = factor * other_factor

      if palindromic?(product)
        palindromes.fetch(product) { palindromes[product] = OpenStruct.new(value: product, factors: []) }
        palindromes[product][:factors] << [other_factor, factor]
      end
    end
  end

  def palindromic?(number)
    number.to_s == number.to_s.reverse
  end

  def min_key
    palindromes.keys.min
  end

  def max_key
    palindromes.keys.max
  end
end
