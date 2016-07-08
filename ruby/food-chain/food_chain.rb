require 'ostruct'

module BookKeeping
  VERSION = 2
end

module FoodChain
  CHARACTERS = [
    OpenStruct.new(
      :name => "fly", 
      remark: "",
      action: ""
    ),
    OpenStruct.new(
      :name => "spider", 
      remark: "It wriggled and jiggled and tickled inside her.",
      action: " that wriggled and jiggled and tickled inside her"
    ),
    OpenStruct.new(
      :name => "bird", 
      remark: "How absurd to swallow a bird!",
      action: ""
    ),
    OpenStruct.new(
      :name => "cat", 
      remark: "Imagine that, to swallow a cat!",
      action: ""
    ),
    OpenStruct.new(
      :name => "dog", 
      remark: "What a hog, to swallow a dog!",
      action: ""
    ),
    OpenStruct.new(
      :name => "goat", 
      remark: "Just opened her throat and swallowed a goat!",
      action: ""
    ),
    OpenStruct.new(
      :name => "cow", 
      remark: "I don't know how she swallowed a cow!",
      action: ""
    ),
    OpenStruct.new(
      :name => "horse", 
      remark: "",
      action: ""
    )
  ]

  def self.song
    end_index = CHARACTERS.length - 1

    (0..end_index).each_with_object([]) { |n, cumulative_song|
      cumulative_song << Story.new(CHARACTERS[0..n], n == end_index).tell
    }.join("\n\n").concat("\n")
  end
end

class Story
  attr_reader :characters, :final

  def initialize(characters, final)
    @characters = characters
    @final = final
  end

  def tell
    [intro, remark, history, outro].reject { |part| part.empty? }.join("\n")
  end

  private

    def first_in_chain
      characters.first
    end 

    def last_in_chain
      characters.last
    end

    def intro
      "I know an old lady who swallowed a #{last_in_chain.name}."
    end

    def remark
      last_in_chain.remark
    end

    def outro
      return "She's dead, of course!" if final

      "I don't know why she swallowed the #{first_in_chain.name}. Perhaps she'll die."
    end

    def history
      return "" if characters.length <= 1 || final 

      records = []
      characters.each_cons(2) do |previous, current| 
        records << record(previous, current)
      end
      records.reverse.join("\n")
    end

    def record(victim, attacker)
      "She swallowed the #{attacker.name} to catch the #{victim.name}#{victim.action}."
    end
end
