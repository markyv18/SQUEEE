require 'rails_helper'

feature "user logs in" do
  scenario "using twitter" do
    stub_twitter_omniauth
    visit login_path
    expect(page).to have_link("Sign in with Twitter")
    click_link "Sign in with Twitter"
    expect(page).to have_content("Sign Out")
  end
end
