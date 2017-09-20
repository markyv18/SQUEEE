class WeatherPresenter
  attr_reader :forecast,
              :city

  def initialize(params)
    @city = params
    @forecast = ForecastWeather.find_forecast(params)
  end

end
