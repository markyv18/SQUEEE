require 'rails_helper'

RSpec.feature 'User goes to trip show page' do
  scenario 'and sees the attractions for each day of the trip', js: true do
    user = create(:user)
    trip = create(:trip, user: user)
    create(:itinerary, trip: trip)
    place = create(:place,
                    google_place_id: "ChIJcY8lIE55bIcRKWyHPdIO_VM",
                    name: "Denver Zoo",
                    lat: 39.7505669,
                    lng: -104.9488444)
    place2 = create(:place,
                    google_place_id: "ChIJa7pXU8R4bIcRKgcjPKexbT8",
                    name: "Puzzah! Escape Room",
                    lat: 39.749047,
                    lng: -105.000597)

    create(:itinerary, trip: trip, place: place)
    create(:itinerary, trip: trip, date: "2017-10-29", place: place2)

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(user)

    visit user_trip_path(user, trip)
    expect(page).to have_content "2017-10-28"
    expect(page).to have_content "2017-10-29"
    expect(page).to have_content "2017-10-30"

    expect(page).to have_content "Downtown Aquarium".upcase
    expect(page).to have_content "Denver Zoo".upcase
    expect(page).to_not have_content "Puzzah! Escape Room".upcase

    click_on "2017-10-29"

    expect(page).to have_content "Puzzah! Escape Room".upcase
    expect(page).to_not have_content "Downtown Aquarium".upcase
    expect(page).to_not have_content "Denver Zoo".upcase

    click_on "2017-10-30"

    expect(page).to_not have_content "Puzzah! Escape Room".upcase
    expect(page).to_not have_content "Downtown Aquarium".upcase
    expect(page).to_not have_content "Denver Zoo".upcase
    expect(page).to have_content "No attractions yet! Go add some more!".upcase
  end

  scenario 'and can remove an attraction from their trip', js: true do
    user = create(:user)
    trip = create(:trip, user: user)
    create(:itinerary, trip: trip)
    place = create(:place,
                    google_place_id: "ChIJcY8lIE55bIcRKWyHPdIO_VM",
                    name: "Denver Zoo",
                    lat: 39.7505669,
                    lng: -104.9488444)
    place2 = create(:place,
                    google_place_id: "ChIJa7pXU8R4bIcRKgcjPKexbT8",
                    name: "Puzzah! Escape Room",
                    lat: 39.749047,
                    lng: -105.000597)

    create(:itinerary, trip: trip, place: place)
    create(:itinerary, trip: trip, date: "2017-10-29", place: place2)

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(user)

    visit user_trip_path(user, trip)
    expect(page).to have_content "2017-10-28"
    expect(page).to have_content "2017-10-29"
    expect(page).to have_content "2017-10-30"

    expect(page).to have_content "Downtown Aquarium".upcase
    expect(page).to have_content "Denver Zoo".upcase
    expect(page).to_not have_content "Puzzah! Escape Room".upcase
    # binding.pry
    # first('.remove-attraction-button').click
    first('.attraction-preview').find(:css, '.remove-attraction-button').click
    expect(page).to_not have_content "Downtown Aquarium".upcase
  end
end
