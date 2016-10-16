class Proverb
  def initialize(*chain, **options)
    @phrases = []

    chain.each_cons(2) do |previous, current| 
      @phrases << "For want of a #{previous} the #{current} was lost."  
    end

    @phrases << [
      "And all for the want of a", 
      options[:qualifier], 
      "#{chain.first}."
    ].compact.join(" ")
  end

  def to_s
    @phrases.join("\n")
  end
end
