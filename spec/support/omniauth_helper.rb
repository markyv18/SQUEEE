def stub_google_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    provider: "google",
    uid: "12345678910",
    info: {
      email: "bret@spacex.com",
      first_name: "Bret",
      last_name: "Funk"
    }
  })
end

def stub_facebook_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:faceboo] = OmniAuth::AuthHash.new({
    provider: "facebook",
    uid: "12345678910",
    info: {
      email: "bret@spacex.com",
      first_name: "Bret",
      last_name: "Funk"
    }
  })
end

def stub_twitter_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: "twitter",
    uid: "12345678910",
    info: {
      email: "bret@spacex.com",
      first_name: "Bret",
      last_name: "Funk"
    }
  })
end

def stub_amazon_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:amazon] = OmniAuth::AuthHash.new({
    provider: "amazon",
    uid: "12345678910",
    info: {
      email: "bret@spacex.com",
      first_name: "Bret",
      last_name: "Funk"
    }
  })
end

def stub_twitch_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitch] = OmniAuth::AuthHash.new({
    provider: "twitch",
    uid: "12345678910",
    info: {
      email: "bret@spacex.com",
      first_name: "Bret",
      last_name: "Funk"
    }
  })
end

def stub_github_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: "github",
    uid: "12345678910",
    info: {
      email: "bret@spacex.com",
      first_name: "Bret",
      last_name: "Funk"
    }
  })
end

