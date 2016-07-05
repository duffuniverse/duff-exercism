class Robot
  @@names_enum = ('AA000'..'ZZ999').to_a.shuffle.each 

  def name
    @name ||= generate_name
  end

  def reset
    @name = nil
  end

  private 

  def generate_name
    @@names_enum.next
  end
end

module BookKeeping
  VERSION = 2
end
