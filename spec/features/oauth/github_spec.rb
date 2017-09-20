require 'rails_helper'

feature "user logs in" do
  scenario "using github" do
    stub_github_omniauth
    visit login_path
    expect(page).to have_link("Sign in with Github")
    click_link "Sign in with Github"
    expect(page).to have_content("Sign Out")
  end
end
