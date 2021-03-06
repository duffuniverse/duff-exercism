class Cipher
  KEY_LENGTH = 100
  ALPHABET = ('a'..'z').to_a
  OPERATIONS = { 
    encode: :+, 
    decode: :- 
  }.freeze

  attr_reader :key

  def self.generate_key
    ''.tap do |k|
      KEY_LENGTH.times { k << ALPHABET.sample }
    end
  end

  def initialize(key = self.class.generate_key)
    unless key =~ /\A[#{ALPHABET.join}]+\z/
      raise ArgumentError.new('Key must contain only lowercase letters') 
    end

    @key = key
    @key_bytes = to_bytes(@key)
  end

  def encode(plain_text)
    replace_letters(plain_text, :encode)
  end

  def decode(encrypted_text)
    replace_letters(encrypted_text, :decode)
  end

  private

  def replace_letters(text, operation)
    to_string transformed_byte_array(to_bytes(text), operation)
  end

  def transformed_byte_array(bytes, operation)
    bytes.
      map.
      with_index { |byte, index| new_byte_value(byte, index, OPERATIONS[operation]) }
  end

  def new_byte_value(byte, index, method)
    byte_in_key_bytes = @key_bytes[index % @key.length]
    byte.send(method, byte_in_key_bytes) % ALPHABET.size
  end

  def to_bytes(string)
    string.
      bytes.
      map { |byte_value| byte_value - ALPHABET.first.ord }
  end

  def to_string(bytes)
    bytes.
      map { |byte_value| (byte_value + ALPHABET.first.ord).chr }.
      join
  end
end
