require 'rails_helper'

describe "User can see extended forecast for their entered destination City, ST" do
  scenario "controller call displays weather for that location", js: true do
      # if AJAX fix is found reinsert VCR
      visit root_path
      fill_in :destination, with: "Bend, OR"
      click_on "Submit"
      
      click_link "Click for extended forecast:"

      expect(current_path).to eq(weather_path)

      expect(page).to have_content("YOUR EXTENDED FORECAST FOR BEND, OR")
  end
end
