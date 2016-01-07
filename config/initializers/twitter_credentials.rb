$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["TWITTER_CLIENT_ID"]
  config.consumer_secret = ENV["TWITTER_CLIENT_SECRET"]
  config.oauth_token = ENV["TWITTER_ACCESS_TOKEN"]
  config.oauth_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
