class SendTripJob < ApplicationJob
  queue_as :default

  def perform(trip)
    TripMailer.trip_email(trip).deliver_later
  end
end
