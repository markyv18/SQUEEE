require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  it "sends welcome email" do
    user = create(:user)
    email = UserMailer.welcome_email(user).deliver_now
    expect(email.from.first).to eq("cloneyislandtravel@gmail.com")
    expect(email.to.first).to eq(user.email)
    expect(email.subject).to eq("Welcome to Cloney Island Travel")
  end
end
