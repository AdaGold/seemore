Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_CLIENT_ID"], ENV["TWITTER_CLIENT_SECRET"]
  provider :vimeo, ENV["VIMEO_CLIENT_ID"], ENV["VIMEO_CLIENT_SECRET"]

  if Rails.env.development?
    provider :developer,
      :fields => [:first_name, :last_name],
      :uid_field => :last_name
  end
end
