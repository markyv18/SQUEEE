require 'rails_helper'

describe 'Iitneraries API' do
  it "can delete an itinerary from a trip" do
    trip = create(:trip)
    create(:itinerary, trip: trip)
    place = create(:place,
                    google_place_id: "ChIJcY8lIE55bIcRKWyHPdIO_VM",
                    name: "Denver Zoo",
                    lat: 39.7505669,
                    lng: -104.9488444)
    create(:itinerary, trip: trip, place: place)
    to_del = create(:itinerary, trip: trip, date: "2017-10-29")

    expect(trip.places.count).to eq 3

    delete "/api/v1/trips/#{trip.id}/itineraries/#{to_del.id}"

    expect(response).to have_http_status(:no_content)
    expect(trip.places.count).to eq 2
  end
end
