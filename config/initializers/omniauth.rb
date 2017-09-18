Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    scope: 'email, profile'

  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    scope: 'public_profile,email'

  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

  provider :amazon, ENV['AMAZON_CLIENT_ID'], ENV['AMAZON_CLIENT_SECRET'],
    scope: 'profile'

  provider :twitch, ENV["TWITCH_CLIENT_ID"], ENV["TWITCH_CLIENT_SECRET"]

  provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"]
end
