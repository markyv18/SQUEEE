require "rails_helper"

RSpec.describe TripMailer, type: :mailer do
  it "sends welcome email" do
    user = create(:user)
    trip = create(:trip, user_id: user.id)
    email = TripMailer.trip_email(trip).deliver_now
    expect(email.from.first).to eq("cloneyislandtravel@gmail.com")
    expect(email.to.first).to eq(user.email)
    expect(email.subject).to eq("Your Trip Itinerary")
  end
end
