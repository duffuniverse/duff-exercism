class SpaceAge
  EARTH_ORBITAL_PERIOD_IN_SECONDS = 31_557_600
  PLANETS = %i{ earth mercury venus mars jupiter saturn uranus neptune }

  ORBITAL_PERIODS = {
    earth: 1.0,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  def initialize(age_in_seconds)
    @seconds = age_in_seconds
  end

  PLANETS.each do |planet|
    define_method("on_#{planet}") do
      age_in_planet_years(planet) 
    end
  end

  def seconds
    @seconds.to_f
  end

  private 

  def age_in_planet_years(planet)
    orbital_period_in_earth_years = ORBITAL_PERIODS[planet]
    (seconds / EARTH_ORBITAL_PERIOD_IN_SECONDS / orbital_period_in_earth_years).round(2)
  end
end

