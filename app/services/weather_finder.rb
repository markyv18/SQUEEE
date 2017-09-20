class WeatherFinder

  def self.current_call(destination)
    a = /^([^,]+),\s([A-Z]{2})/.match(destination)
    response = Faraday.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_API_KEY"]}/conditions/q/#{a[2]}/#{a[1]}.json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.forecast_call(destination)
    byebug
    a = /^([^,]+),\s([A-Z]{2})/.match(destination)
    response = Faraday.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_API_KEY"]}/forecast/q/#{a[2]}/#{a[1]}.json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def destination_split(destination)
    /^([^,]+),\s([A-Z]{2})/.match(destination)
  end

end
