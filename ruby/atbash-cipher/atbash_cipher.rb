module Atbash
  ALPHABET = ('a'..'z').to_a.join

  def self.encode(text)
    text.downcase.
      gsub(/[^a-z0-9]/, '').
      tr(ALPHABET, ALPHABET.reverse).
      scan(/.{1,5}/).
      join(" ")
  end
end
