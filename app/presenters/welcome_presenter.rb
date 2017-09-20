class WelcomePresenter
  attr_reader :current_weather,
              :cities

  def initialize(params)
    @cities = city
    @current_weather = retrieve_weather(params)
  end

  def city
    City.all #.pluck(:id)
  end

  def retrieve_weather(params)
    if params[:destination] != nil
      @weather = CurrentWeather.find_current_weather(params[:destination])
    end
  end

end
