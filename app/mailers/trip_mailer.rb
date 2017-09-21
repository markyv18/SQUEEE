class TripMailer < ApplicationMailer

  def trip_email(trip)
    @user = trip.user
    city_st = trip.start_city + ", " + trip.city.state
    @forecast = ForecastWeather.find_forecast(city_st)
    @trip = trip
    mail(to: @user.email, subject: 'Your Trip Itinerary and Forecast')
  end
end
