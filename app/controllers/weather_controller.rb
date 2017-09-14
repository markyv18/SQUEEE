class WeatherController < ApplicationController
  def index
    # @forecast = Weather.find_forecast(params[:thing])
  end
  def show
    # @current_weather = CurrentWeather.find_current_weather(params[:destination])
    # redirect_to root_path
  end
end

#
# {
#
#     "current_observation": {
#
#         "display_location": {
#             "full": "Boulder, CO"
#         },
#
#         "weather": "Overcast",
#         "temperature_string": "78.1 F (25.6 C)",
#         "relative_humidity": "41%",
#         "wind_string": "Calm",
#     }
# }
