class WeatherController < ApplicationController
  def index
    byebug
    @forecast = ForecastWeather.find_forecast(params[:destination_forecast])
  end
end
