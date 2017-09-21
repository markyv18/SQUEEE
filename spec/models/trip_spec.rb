require 'rails_helper'

RSpec.describe Trip do
  context "attributes" do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:start_city) }
  end

  context "relationships" do
    it "has relationships" do
      trip = create(:trip)
      expect(trip).to respond_to :user
      expect(trip).to respond_to :itineraries
      expect(trip).to respond_to :city
    end

    it "can create attractions by date" do
      VCR.use_cassette('models/attractions_by_date') do
        trip = create(:trip)
        create(:itinerary, trip: trip)
        place = create(:place,
                        google_place_id: "ChIJcY8lIE55bIcRKWyHPdIO_VM",
                        name: "Denver Zoo",
                        lat: 39.7505669,
                        lng: -104.9488444)
        create(:itinerary, trip: trip, place: place)
        create(:itinerary, trip: trip, date: "2017-10-29")

        attractions = trip.attractions_by_date("2017-10-28")

        expect(attractions.count).to eq 2
        expect(attractions.first).to be_a Attraction
      end
    end

    it "can create places by date" do
      trip = create(:trip)
      create(:itinerary, trip: trip)
      place = create(:place,
                      google_place_id: "ChIJcY8lIE55bIcRKWyHPdIO_VM",
                      name: "Denver Zoo",
                      lat: 39.7505669,
                      lng: -104.9488444)
      create(:itinerary, trip: trip, place: place)
      create(:itinerary, trip: trip, date: "2017-10-29")

      places = trip.places_by_date("2017-10-28")

      expect(places.count).to eq 2
      expect(places.first).to be_a Place
    end

    it "can delete a certain itinerary" do
      trip = create(:trip)
      create(:itinerary, trip: trip)
      place = create(:place,
                      google_place_id: "ChIJcY8lIE55bIcRKWyHPdIO_VM",
                      name: "Denver Zoo",
                      lat: 39.7505669,
                      lng: -104.9488444)
      to_del = create(:itinerary, trip: trip, place: place)
      create(:itinerary, trip: trip, date: "2017-10-29")

      trip.delete_itinerary(to_del.date, place.name)

      expect(trip.places).to_not include place
    end
  end
end
