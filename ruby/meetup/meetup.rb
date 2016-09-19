class Meetup
  DAYS_OF_WEEK = {
    sunday: 0,
    monday: 1, 
    tuesday: 2, 
    wednesday: 3, 
    thursday: 4, 
    friday: 5, 
    saturday: 6 
  }.freeze 
  
  SCHEDULE_TYPES = {
    first: 0, 
    second: 1, 
    third: 2, 
    fourth: 3, 
    last: -1,
    teenth: nil
  }.freeze

  TEENTHS = 13..19

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, schedule_type)
    send(schedule_type, day_of_week) if SCHEDULE_TYPES.include?(schedule_type)
  end

  SCHEDULE_TYPES.each do |schedule_type, index|
    define_method(schedule_type) do |day_of_week| 
      if schedule_type == :teenth
        TEENTHS.to_a.
          map { |day| Date.new(@year, @month, day) }.
          find { |date| date.wday == DAYS_OF_WEEK[day_of_week] }
      else
        (Date.new(@year, @month, 1)..Date.new(@year, @month, -1)).to_a.
          select { |date| date.wday == DAYS_OF_WEEK[day_of_week] }[index]
      end
    end
  end
end
