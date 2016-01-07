class Medium < ActiveRecord::Base
  belongs_to :handle

  def self.create_medium(tweet_instance)
    medium = Medium.new
    medium.text = tweet_instance.text
    medium.uri = tweet_instance.uri.to_s
    medium.handle_id = (Handle.find_by twitter_id: tweet_instance.user.id).id
    medium.type = "twitter"
    medium.save
  end
end
