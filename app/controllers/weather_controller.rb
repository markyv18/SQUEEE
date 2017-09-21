class WeatherController < ApplicationController
  def index
    @wx_presenter = WeatherPresenter.new(session[:wx_city])
  end
end
