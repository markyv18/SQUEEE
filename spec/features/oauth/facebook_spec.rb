require 'rails_helper'

feature "user logs in" do
  scenario "using facebook" do
    stub_facebook_omniauth
    visit login_path
    expect(page).to have_link("Sign in with Facebook")
    click_link "Sign in with Facebook"
    expect(page).to have_content("Sign Out")
  end
end
