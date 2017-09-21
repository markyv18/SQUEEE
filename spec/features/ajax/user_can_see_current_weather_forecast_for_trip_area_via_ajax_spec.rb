require 'rails_helper'

describe "User can see weather for their entered destination City, ST" do
  scenario "ajax call displays weather for that location without a page reload", js: true do
    # if AJAX fix is found reinsert VCR

      visit root_path
      fill_in :destination, with: "Bend, OR"
      click_on "Submit"

      wait_for_ajax
      expect(current_path).to eq(root_path)

      expect(page).to have_content("Click for extended forecast:")
      expect(page).to have_content("Bend, OR: ")
      expect(page).to have_content("Degrees")
      expect(page).to have_content("&")
      expect(page).not_to have_content("City, ST")
  end
end
