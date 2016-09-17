class Say
  DICTIONARY = {
    '0' => 'zero',
    '1'	=> 'one',
    '2'	=> 'two',
    '3' => 'three',
    '4'	=> 'four',
    '5'	=> 'five',
    '6' => 'six',
    '7'	=> 'seven',
    '8' => 'eight',
    '9' => 'nine',
    '10' =>	'ten',
    '11' =>	'eleven',
    '12' =>	'twelve',
    '13' =>	'thirteen',	
    '14' => 'fourteen',
    '15' =>	'fifteen',
    '16' =>	'sixteen',
    '17' => 'seventeen',
    '18' => 'eighteen',
    '19' => 'nineteen',
    '20' => 'twenty',
    '30' =>	'thirty',
    '40' =>	'forty',
    '50' =>	'fifty',
    '60' =>	'sixty',
    '70' =>	'seventy',
    '80' =>	'eighty',
    '90' =>	'ninety'
  }.freeze

  DECIMAL_UNITS = {
    1 => 'thousand',
    2 => 'million',
    3 => 'billion'
  }.freeze

  RANGE = 0...10**12

  CHUNK_SIZE = 3

  def initialize(number)
    @number = number
  end

  def in_english
    raise ArgumentError unless RANGE.include?(@number)

    return DICTIONARY['0'] if zero? 

    chunks.each_with_index.inject([]) do |result, (chunk, index)|
      result.concat(insert_scale_word(chunk, index))
    end.
    compact.
    join(' ')
  end

  private

  def chunks
    @chunks ||= @number.to_s.
      reverse.
      chars.
      each_slice(CHUNK_SIZE).
      map(&:reverse).
      map(&:join).
      reverse
  end

  def zero?
    chunks.length == 1 && chunks.first == '0'
  end

  def insert_scale_word(string, current_index)
    [].tap do |result|
      result.concat(parse_chunk(string))
    end.
    compact.
    tap { |result| result << decimal_unit(current_index) unless result.empty? }
  end

  def decimal_unit(current_index)
    next_chunk_index = current_index + 1

    DECIMAL_UNITS[
      chunks[next_chunk_index..-1].count
    ]
  end

  def parse_chunk(string)
    s = string.gsub(/\A0+/, '')

    return [] if s.empty?

    [].tap do |result|
      result.concat(hundred(s)) 
      result << rest(s)
    end
  end

  def hundred(string)
    return [] unless string.length == CHUNK_SIZE

    [ DICTIONARY[string[0]], 'hundred' ] 
  end

  def rest(string)
    s = if string.length == CHUNK_SIZE
          string[1..-1].gsub(/\A0+/, '')
        else
          string
        end

    return nil if s.empty?

    DICTIONARY[s] || (DICTIONARY[s[0] + '0'] + '-' + DICTIONARY[s[1]])
  end
end
