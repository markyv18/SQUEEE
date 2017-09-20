require 'rails_helper'

RSpec.describe User do
  context "attributes" do
    #it { should validate_presence_of(:first_name) }
    #it { should validate_presence_of(:last_name) }
    #it { should validate_presence_of(:email) }
    #it { should validate_presence_of(:phone) }
    #it { should validate_presence_of(:password) }
    #it { should validate_presence_of(:status) }
  end

  context "relationships" do
    it "has relationships" do
      user = create(:user)
      expect(user).to respond_to :tours
      expect(user).to respond_to :messages
      expect(user).to respond_to :trips
    end
  end

  it "creates or updates itself from an oauth hash" do
    auth = {
      "provider"=>"google",
      "uid"=>"12345678910",
      "info"=>{
        "email"=>"bret@spacex.com",
        "first_name"=>"Bret",
        "last_name"=>"Funk"
      },
    }
    auth = auth.to_json
    auth = JSON.parse(auth)
    User.find_or_create_by_auth(auth)
    new_user = User.last

    expect(new_user.provider).to eq("google")
    expect(new_user.uid).to eq("12345678910")
    expect(new_user.email).to eq("bret@spacex.com")
    expect(new_user.first_name).to eq("Bret")
    expect(new_user.last_name).to eq("Funk")

  end
end
