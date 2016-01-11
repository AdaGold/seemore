module Vimeo
  class Video < Base
    attr_reader :uri, :name, :link, :embed
    attr_accessor :subscribed

    def initialize(user_hash)
      @uri = user_hash["uri"]
      @name = user_hash["name"]
      @embed = user_hash["embed"]["html"].delete('\"')
      @description = user_hash["description"]
    end

    def self.get_user_videos(user_uri, page=1)
      query = "fields=name,description,embed,uri"

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
