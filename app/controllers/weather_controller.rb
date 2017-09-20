class WeatherController < ApplicationController
  def index
    byebug
    @forecast = ForecastWeather.find_forecast(params[:forecast])
  end
end
