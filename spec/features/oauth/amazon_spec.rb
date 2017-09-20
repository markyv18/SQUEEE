require 'rails_helper'

feature "user logs in" do
  scenario "using amazon" do
    stub_amazon_omniauth
    visit login_path
    expect(page).to have_link("Sign in with Amazon")
    click_link "Sign in with Amazon"
    expect(page).to have_content("Sign Out")
  end
end
