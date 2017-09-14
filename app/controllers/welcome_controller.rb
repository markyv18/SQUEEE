class WelcomeController < ApplicationController
  def index
    @cities = City.all.map { |city| city.id }
    if params[:destination]
      @current_weather = CurrentWeather.find_current_weather(params[:destination])
    end
  end
end
