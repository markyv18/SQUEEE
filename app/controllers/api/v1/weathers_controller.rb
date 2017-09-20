class Api::V1::WeathersController < ApplicationController
  def index
    @current_wx = CurrentWeather.find_current_weather(params[:destination])
    render json: @current_wx
  end
end
