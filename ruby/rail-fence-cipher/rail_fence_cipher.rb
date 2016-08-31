class RailFenceCipher
  VERSION = 1

  def self.encode(text, rails)
    zig_zag(rails, text.length).
      zip(text.chars).
      sort.
      map { |a| a[1] }.
      join
  end

  def self.decode(ciphertext, rails)
    zig_zag(rails, ciphertext.length).
      sort.
      zip(ciphertext.chars).
      sort_by { |a| a[0][1] }.
      map { |a| a[1] }.
      join
  end

  def self.zig_zag(rails, size)
    pattern = (0..rails - 1).to_a + (1..rails - 2).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end
end
