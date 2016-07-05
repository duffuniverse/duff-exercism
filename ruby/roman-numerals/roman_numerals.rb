# http://www.sandimetz.com/blog/2016/6/9/make-everything-the-same
# https://github.com/skmetz/play/blob/master/roman_numerals/roman_numerals_medium.rb

module Roman
  refine Fixnum do
    def to_roman
      RomanNumerals.to_roman(self)
    end
  end
end
 
using Roman

module RomanNumerals
  ROMAN_NUMERALS = {
    1000 => 'M',
     500 => 'D',
     100 => 'C',
      50 => 'L',
      10 => 'X',
       5 => 'V',
       1 => 'I'
  }

  LONG_TO_SHORT_MAP = {
    'DCCCC' => 'CM', # 900
    'CCCC'  => 'CD', # 400
    'LXXXX' => 'XC', # 90
    'XXXX'  => 'XL', # 40
    'VIIII' => 'IX', # 9
    'IIII'  => 'IV'  # 4
  }

  def self.to_roman(number)
    result = ''

    ROMAN_NUMERALS.keys.reduce(number) do |to_be_converted, base_10_value|
      num_chars_needed, remainder = to_be_converted.divmod(base_10_value)
      result << ROMAN_NUMERALS[base_10_value] * num_chars_needed
      remainder
    end

    to_subtractive_roman(result)
  end

  def self.to_subtractive_roman(roman)
    LONG_TO_SHORT_MAP.keys.reduce(roman) do |converted_roman, alternate_form|
      converted_roman.gsub(/#{alternate_form}/, LONG_TO_SHORT_MAP[alternate_form])
    end
  end
end

module BookKeeping
  VERSION = 2
end
