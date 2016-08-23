class Crypto
  def initialize(plain_text)
    @text = plain_text.downcase.gsub(/\W/, '')
  end

  def normalize_plaintext
    @text
  end

  def size
    @columns_number ||= Math.sqrt(normalize_plaintext.length).ceil 
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    normalize_ciphertext.delete(' ')
  end

  def normalize_ciphertext
    (0...size).each_with_object("") do |index, result|
      plaintext_segments.each do |segment|
        result.concat(segment[index]) if segment[index]
      end
      result.concat(' ')
    end.rstrip 
  end
end
