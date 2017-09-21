require "rails_helper"

RSpec.describe TripMailer, type: :mailer do
  it "sends welcome email" do
    city = create(:city)
    user = create(:user)
    itinerary = create(:itinerary)

    trip = create(:trip, user_id: user.id, city_id: city.id)

    email = TripMailer.trip_email(trip).deliver_now
    last_delivery = ActionMailer::Base.deliveries.last

    expect(email.from.first).to eq("cloneyislandtravel@gmail.com")
    expect(email.to.first).to eq(user.email)
    expect(email.subject).to eq("Your Trip Itinerary and Forecast")

    expect(last_delivery.body.raw_source).to have_content("Time: ")
    expect(last_delivery.body.raw_source).to have_content("Forecast: ")
    expect(last_delivery.body.raw_source).to have_content("Chance of Precipitation: ")
    expect(last_delivery.body.raw_source).to have_content("%")

  end
end
