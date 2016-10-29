class PigLatin
  def self.translate(phrase)
    phrase.
      split.
      map do |word| 
        if word =~ /\A([aeiou]|y[^aeiou]|xr)/
          word + "ay"
        else
          consonant, rest = word.scan(/\A([^aeiou]?qu|[^aeiou]+)(.*)/).first
          rest + consonant + "ay"
        end
      end.
      join(" ")
  end
end


