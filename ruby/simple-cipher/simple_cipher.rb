class Cipher
  attr_reader :key

  def initialize(key = generate_key)
    raise ArgumentError.new('Key must contain only lowercase letters') unless key =~ /[a-z]/

    @key = key
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

  def generate_key
    ''.tap do |k|
      100.times { k << ('a'..'z').to_a.sample }
    end
  end

  def to_bytes(string)
    string.bytes.map { |byte_value| byte_value - 97 }
  end

  def to_string(bytes)
    bytes.map { |byte_value| (byte_value + 97).chr }.join
  end
end
