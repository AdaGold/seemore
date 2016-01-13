require 'vimeo'

class Feed

  def self.update
    unless Handle.all.empty?
      query_string = ""
      response = []
      len = Handle.all.length
      if (len / 10) < 1
        denominator = 1
      else
        denominator = len / 10
      end

      handles = Handle.all.take(len).each_slice(len / denominator).to_a[rand(denominator).to_i]
      tracked = Medium.pluck(:uri)

      handles.each do |handle|
        if handle.provider == "twitter"
          query_string += "from:#{handle.name} OR "
        elsif handle.provider == "vimeo"
          response += Vimeo::Video.get_user_videos(handle.uri)
        end
      end

      response += $twitter.search(query_string, result_type: "recent").take(100) unless query_string.empty?

      handles.each do |handle|
        response.each do |medium|
          unless tracked.include?(medium.uri.to_s)
            if medium.class == Twitter::Tweet
              new_tweet = Medium.create_tweet_medium(medium)
              new_tweet.update(handle_id: handle.id)
            elsif medium.class == Vimeo::Video
              Medium.create(uri: medium.uri, embed: medium.embed, posted_at: medium.posted_at, handle_id: handle.id)
            end
          end
        end
      end
    end
  end

end
