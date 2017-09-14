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
#
#
# {
#     "response": {
#         "version": "0.1",
#         "termsofService": "http://www.wunderground.com/weather/api/d/terms.html",
#         "features": {
#             "conditions": 1
#         }
#     },
#     "current_observation": {
#         "image": {
#             "url": "http://icons.wxug.com/graphics/wu2/logo_130x80.png",
#             "title": "Weather Underground",
#             "link": "http://www.wunderground.com"
#         },
#         "display_location": {
#             "full": "Boulder, CO",
#             "city": "Boulder",
#             "state": "CO",
#             "state_name": "Colorado",
#             "country": "US",
#             "country_iso3166": "US",
#             "zip": "80301",
#             "magic": "1",
#             "wmo": "99999",
#             "latitude": "40.04999924",
#             "longitude": "-105.20999908",
#             "elevation": "1585.0"
#         },
#         "observation_location": {
#             "full": "63rd St and Jay Rd, Boulder, Colorado",
#             "city": "63rd St and Jay Rd, Boulder",
#             "state": "Colorado",
#             "country": "US",
#             "country_iso3166": "US",
#             "latitude": "40.055550",
#             "longitude": "-105.208595",
#             "elevation": "5202 ft"
#         },
#         "estimated": {},
#         "station_id": "KCOBOULD39",
#         "observation_time": "Last Updated on September 13, 3:22 PM MDT",
#         "observation_time_rfc822": "Wed, 13 Sep 2017 15:22:16 -0600",
#         "observation_epoch": "1505337736",
#         "local_time_rfc822": "Wed, 13 Sep 2017 15:22:16 -0600",
#         "local_epoch": "1505337736",
#         "local_tz_short": "MDT",
#         "local_tz_long": "America/Denver",
#         "local_tz_offset": "-0600",
#         "weather": "Overcast",
#         "temperature_string": "78.1 F (25.6 C)",
#         "temp_f": 78.1,
#         "temp_c": 25.6,
#         "relative_humidity": "41%",
#         "wind_string": "Calm",
#         "wind_dir": "NNE",
#         "wind_degrees": 31,
#         "wind_mph": 0,
#         "wind_gust_mph": 0,
#         "wind_kph": 0,
#         "wind_gust_kph": 0,
#         "pressure_mb": "1014",
#         "pressure_in": "29.94",
#         "pressure_trend": "0",
#         "dewpoint_string": "52 F (11 C)",
#         "dewpoint_f": 52,
#         "dewpoint_c": 11,
#         "heat_index_string": "NA",
#         "heat_index_f": "NA",
#         "heat_index_c": "NA",
#         "windchill_string": "NA",
#         "windchill_f": "NA",
#         "windchill_c": "NA",
#         "feelslike_string": "78.1 F (26 C)",
#         "feelslike_f": "78.1",
#         "feelslike_c": "26",
#         "visibility_mi": "10.0",
#         "visibility_km": "16.1",
#         "solarradiation": "--",
#         "UV": "3",
#         "precip_1hr_string": "0.00 in ( 0 mm)",
#         "precip_1hr_in": "0.00",
#         "precip_1hr_metric": " 0",
#         "precip_today_string": "0.00 in (0 mm)",
#         "precip_today_in": "0.00",
#         "precip_today_metric": "0",
#         "icon": "cloudy",
#         "icon_url": "http://icons.wxug.com/i/c/k/cloudy.gif",
#         "forecast_url": "http://www.wunderground.com/US/CO/Boulder.html",
#         "history_url": "http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=KCOBOULD39",
#         "ob_url": "http://www.wunderground.com/cgi-bin/findweather/getForecast?query=40.055550,-105.208595",
#         "nowcast": ""
#     }
# }
