class Cipher
  attr_reader :key

  def initialize(key = nil, key_length = 100)
    key_valid?(key) if key

    @key = key || random_key(key_length)
    @key_bytes = to_bytes(@key)
  end

  def encode(plain_text)
    encrypted_text_bytes = []

    to_bytes(plain_text).each_with_index do |byte, index|
      encrypted_text_bytes << (byte + @key_bytes[index % @key.length]) % 26
    end

    to_string(encrypted_text_bytes)
  end

  def decode(encrypted_text)
    plain_text_bytes = []

    to_bytes(encrypted_text).each_with_index do |byte, index|
      plain_text_bytes << (byte - @key_bytes[index % @key.length]) % 26
    end

    to_string(plain_text_bytes)
  end

  private

  def key_valid?(key)
    raise ArgumentError.new('Key must not be empty') if key.empty?
    raise ArgumentError.new('Key must contain only small letters') if key =~ /[A-Z0-9]/
  end

  def random_key(length)
    ''.tap do |k|
      length.times { k << ('a'..'z').to_a.sample }
    end
  end

  def to_bytes(string)
    string.bytes.map { |byte_value| byte_value - 97 }
  end

  def to_string(bytes)
    bytes.map { |byte_value| (byte_value + 97).chr }.join
  end
end
