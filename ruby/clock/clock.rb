class Clock
  HOURS_IN_DAY = 24
  MINUTES_IN_HOUR = 60

  def self.at(hours, minutes)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours = (hours + minutes / MINUTES_IN_HOUR) % HOURS_IN_DAY
    @minutes = minutes % MINUTES_IN_HOUR
  end

  def to_s
    sprintf("%02d:%02d", @hours, @minutes)
  end

  def +(other)
    self.class.new(@hours, @minutes + other)
  end

  def ==(other)
    other.class == self.class && other.state == state
  end

  protected

  def state
    [@hours, @minutes]
  end
end

module BookKeeping
  VERSION = 2
end
