class Api::V1::WeathersController < ApplicationController
  def index
    session[:wx_city] = params[:destination]
    @current_wx = CurrentWeather.find_current_weather(params[:destination])
    render json: @current_wx
  end
end
