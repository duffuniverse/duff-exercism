class Bob
  def hey(remark)
    answer(remark)
  end

  private

    def answer(message)
      Message.new(message).
        if_question { return approve }.
        if_yell { return anxious }.
        if_silent { return annoyed }.
        if_whatever { return neutral }
    end

    def approve
      "Sure."
    end

    def annoyed
      "Fine. Be that way!"
    end

    def anxious
      "Whoa, chill out!"
    end

    def neutral
      "Whatever." 
    end
end

class Message
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def if_yell
    yield if all_capitals? 
    self
  end
  
  def if_question
    yield if text.end_with?('?') && !all_capitals? 
    self
  end

  def if_silent
    yield if text.strip.empty?
    self
  end

  def if_whatever
    yield
    self
  end

  private
    
    def all_capitals?
      letters = text.gsub(/[^a-zA-Z]/, '')
      !letters.empty? && letters == letters.upcase
    end
end
