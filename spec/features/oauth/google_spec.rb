require 'rails_helper'

feature "user logs in" do
  scenario "using google oauth2" do
    stub_google_omniauth
    visit login_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
    expect(page).to have_content("Sign Out")
  end
end
