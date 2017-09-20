class ForecastWeather
  attr_reader :day,
              :temp_text,
              :percent_precip,
              :weather_icon_url,
              :today_plus # 0 is today 1 is tomorrow, 2 is 2 days from now... add it to a date to generate day of the week?

  def initialize(day_forecast)
      @day = day_forecast[:title]
      @temp_text = day_forecast[:fcttext]
      @percent_precip = day_forecast[:pop]
      @weather_icon_url = day_forecast[:icon_url]
  end

  def self.find_forecast(destination)
    forecast_api = WeatherFinder.forecast_call(destination)
    forecast_api[:forecast][:txt_forecast][:forecastday].map do |day|
      ForecastWeather.new(day)
    end
  end

end
