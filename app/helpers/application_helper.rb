module ApplicationHelper

  def weather_toggle
    if params[:destination] 
      "layouts/yes_weather"
    else
      "layouts/no_weather"
    end
  end

end
