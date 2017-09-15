class CurrentWeather
  attr_reader :location,
              :conditions,
              :temp,
              :humidity,
              :wind

  def initialize(weather)
    @location = weather[:current_observation][:display_location][:full]
    @conditions = weather[:current_observation][:weather]
    @temp = weather[:current_observation][:temperature_string]
    @humidity = weather[:current_observation][:relative_humidity]
    @wind = weather[:current_observation][:wind_string]
  end

  def self.find_current_weather(destination)
    current_weather_api = WeatherFinder.current_call(destination)
    CurrentWeather.new(current_weather_api)
  end

end
