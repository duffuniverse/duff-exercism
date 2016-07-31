module BookKeeping
  VERSION = 2
end

class BeerSong
  BOTTLES_TOTAL = 99

  def verse(bottles_count)
    Verse.new(bottles_count).tell
  end

  def verses(start, finish)
    start.downto(finish).to_a.map { |bottles_count| verse(bottles_count) }.join("\n")
  end

  def lyrics
    verses(BOTTLES_TOTAL, 0)
  end
end

module Verse
  def self.new(bootles_count)
    if bootles_count.zero?
      NoMoreBottles
    elsif bootles_count == 1
      OnlyOneBottle
    else 
      PlentyOfBottles
    end.new(bootles_count)
  end

  class NoMoreBottles
    attr_reader :bottles_count

    def initialize(bottles_count = 0)
      raise ArgumentError, 'Bottles count must be equal to zero' unless bottles_count.zero?
      @bottles_count = 0
    end

    def tell
      string = Inflector.pluralize(BeerSong::BOTTLES_TOTAL, 'bottle')
      
      [ 
        "No more bottles of beer on the wall, no more bottles of beer.",
        "Go to the store and buy some more, #{string} of beer on the wall."
      ].join("\n").concat("\n")
    end
  end

  class OnlyOneBottle
    attr_reader :bottles_count

    def initialize(bottles_count = 1)
      raise ArgumentError, 'Bottles count must be equal to one' unless bottles_count == 1
      @bottles_count = 1
    end

    def tell
      [ "1 bottle of beer on the wall, 1 bottle of beer.",
        "Take it down and pass it around, no more bottles of beer on the wall."
      ].join("\n").concat("\n")
    end
  end

  class PlentyOfBottles
    attr_reader :bottles_count

    def initialize(bottles_count)
      raise ArgumentError, 'Bottles count must be greater than one' unless bottles_count > 1
      @bottles_count = bottles_count
    end

    def tell
      string = Inflector.pluralize(bottles_count - 1, 'bottle')

      [ "#{bottles_count} bottles of beer on the wall, #{bottles_count} bottles of beer.",
        "Take one down and pass it around, #{string} of beer on the wall."
      ].join("\n").concat("\n")
    end
  end
end

module Inflector
  def self.pluralize(quantity, singular, plural=nil)
    if quantity == 1
      "1 #{singular}"
    elsif plural
      "#{quantity} #{plural}"
    else
      "#{quantity} #{singular}s"
    end
  end
end
