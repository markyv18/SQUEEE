class TripMailer < ApplicationMailer

  def trip_email(trip)
    @user = trip.user
    @trip = trip
    mail(to: @user.email, subject: 'Your Trip Itinerary')
  end
end
