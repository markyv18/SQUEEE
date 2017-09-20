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
    to_del = create(:itinerary, trip: trip, place: place)
    create(:itinerary, trip: trip, date: "2017-10-29")

    expect(trip.places.count).to eq 3

    to_del_params = {date: to_del.date, name: "Denver Zoo"}

    delete "/api/v1/trips/#{trip.id}/itineraries", params: to_del_params

    expect(response).to have_http_status(:no_content)
    expect(trip.places.count).to eq 2
  end
end
