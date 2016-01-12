module Vimeo
  class Video < Base
    attr_reader :uri, :name, :link, :embed
    attr_accessor :subscribed

    def initialize(video_hash)
      @uri = video_hash["uri"]
      @posted_at = video_hash["created_time"]
      @embed = video_hash["embed"]["html"].delete('\"')
    end

    def self.get_user_videos(video_uri, page=1, per_page=5)
      # now that we have create time, pull the first 5
      query = "fields=created_time,embed,uri&page=#{page}&per_page=#{per_page}"

      response = HTTParty.get("#{BASE_URI}/#{user_uri}/videos?#{query}", headers: HEADERS)
      parsed_response = JSON.parse(response)

      video_object_array = Array.new
      parsed_response["data"].each do |hash|
        video_object_array << self.new(hash)
      end

      return video_object_array

      # a.gsub!(/\"/, '\'')
    end

  end
end
