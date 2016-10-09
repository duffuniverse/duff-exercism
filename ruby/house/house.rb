module House
  CHARACTERS = [
    { name: "malt", action: "lay" },
    { name: "rat", action: "ate" },
    { name: "cat", action: "killed" },
    { name: "dog", action: "worried" },
    { name: "cow with the crumpled horn", action: "tossed" },
    { name: "maiden all forlorn", action: "milked" },
    { name: "man all tattered and torn", action: "kissed" },
    { name: "priest all shaven and shorn", action: "married" },
    { name: "rooster that crowed in the morn", action: "woke" },
    { name: "farmer sowing his corn", action: "kept" },
    { name: "horse and the hound and the horn", action: "belonged to" }
  ].freeze

  def self.recite
    (0..CHARACTERS.count).reduce([]) { |song, n| 
      song << Story.new(CHARACTERS.take(n)).tell 
    }.
    join("\n\n").
    concat("\n")
  end

  class Story
    attr_reader :characters

    def initialize(characters)
      @characters = characters
    end

    def tell
      return "This is the house that Jack built." if characters.empty?

      [intro, history, outro].reject { |p| p.empty? }.join("\n")
    end

    private

    def first_in_chain
      characters.first
    end 

    def last_in_chain
      characters.last
    end

    def intro
      "This is the #{last_in_chain[:name]}"
    end

    def history
      return "" if characters.count <= 1 

      records = []
      characters.each_cons(2) do |previous, current| 
        records << "that #{current[:action]} the #{previous[:name]}"
      end
      records.reverse.join("\n")
    end

    def outro
      "that #{first_in_chain[:action]} in the house that Jack built."
    end
  end
end
