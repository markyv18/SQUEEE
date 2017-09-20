require 'rails_helper'

describe "User can see extended forecast for their entered destination City, ST" do
  scenario "controller call displays weather for that location" do
    VCR.use_cassette("services/national_alerts") do

      visit root_path
      fill_in :destination, with: "Bend, OR"
      click_on "Submit"
      expect(current_path).to eq(root_path)

      expect(page).to have_content("Click for extended forecast:")
      expect(page).to have_content("Bend, OR: ")
      expect(page).to have_content("Degrees")
      expect(page).to have_content("&")
      expect(page).not_to have_content("City, ST")
    end
  end
end
