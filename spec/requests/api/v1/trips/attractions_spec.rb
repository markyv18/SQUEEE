require 'rails_helper'

describe 'Attractions API' do
  it "can return attractions by date of trip" do
    VCR.use_cassette('requests/attractions') do
      trip = create(:trip)
      create(:itinerary, trip: trip)
      place = create(:place,
                      google_place_id: "ChIJcY8lIE55bIcRKWyHPdIO_VM",
                      name: "Denver Zoo",
                      lat: 39.7505669,
                      lat: -104.9488444)
      create(:itinerary, trip: trip, place: place)
      create(:itinerary, trip: trip, date: "2017-10-29")

      get "/api/v1/trips/#{trip.id}/attractions", params: {date: "2017-10-28"}

      expect(response).to be_success

      attractions = JSON.parse(response.body)
      attraction = attractions.first

      expect(attractions.count).to eq 2
      expect(attraction).to have_key('name')
      expect(attraction).to have_key('photo_url')
      expect(attraction).to have_key('lat')
      expect(attraction).to have_key('lng')
      expect(attraction).to have_key('html')
      expect(attraction["html"]).to be_a(String)
    end
  end
end
