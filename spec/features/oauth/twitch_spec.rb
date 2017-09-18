require 'rails_helper'

feature "user logs in" do
  scenario "using twitch" do
    stub_twitch_omniauth
    visit login_path
    expect(page).to have_link("Sign in with Twitch")
    click_link "Sign in with Twitch"
    expect(page).to have_content("Sign Out")
  end
end
