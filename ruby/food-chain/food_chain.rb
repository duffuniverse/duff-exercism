require 'ostruct'

module BookKeeping
  VERSION = 2
end

module FoodChain
  CHARACTERS = [
    OpenStruct.new(:name => "fly"),
    OpenStruct.new(:name => "spider"),
    OpenStruct.new(:name => "bird"),
    OpenStruct.new(:name => "cat"),
    OpenStruct.new(:name => "dog"),
    OpenStruct.new(:name => "goat"),
    OpenStruct.new(:name => "cow"),
    OpenStruct.new(:name => "horse")
  ]

  def self.song
    (0...CHARACTERS.length).each_with_object([]) { |n, stories|
      stories << Story.new(CHARACTERS[0..n]).tell
    }.join("\n\n")
  end
end

class Story
  attr_reader :characters

  def initialize(characters)
    @characters = characters
  end

  def tell
    [intro, history, outro].reject { |piece|
      piece.empty? 
    }.join("\n")
  end

  private

    def intro
      "I know an old lady who swallowed a #{characters.last.name}."
    end

    def remark
      characters.last.remark
    end

    def outro
      "I don't know why she swallowed the #{characters.first.name}. Perhaps she'll die."
    end

    def history
      return "" unless characters.length > 1

      records = []
      characters.each_cons(2) do |previous, current| 
        records << record(previous, current)
      end
      records.reverse.join("\n")
    end

    def record(victim, attacker)
      "She swallowed the #{attacker.name} to catch the #{victim.name}."
    end
end

puts FoodChain.song
