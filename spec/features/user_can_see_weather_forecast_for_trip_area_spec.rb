require 'rails_helper'

describe "User can see weather for their entered zip (will switch to auto find location in it2)" do
  scenario "reloads and displays weather for that zip (it2 ajax call)" do
    VCR.use_cassette("services/national_alerts") do

      visit root_path
      fill_in :zip, with: "80305"
      click_on "get weather"

      expect(current_path).to eq(root_path)

      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
    end
  end
end

# (it1) And I fill in a search box with 80305 and click "search"
# (it2) find users location automatically
# Then my current path should be "/"
# And I should see in the navbar the weather for 80305 (refresh it1 - ajax it2)
# And I should see current weather and a link to an extended forecast page
# clicking link to extended forecast page i should be on path '/weather'
# and i should see a 3/5/7/10 day (something) forecast displayed
