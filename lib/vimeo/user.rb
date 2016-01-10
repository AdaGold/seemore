require 'uri'

module Vimeo
  class User
    BASE_URI = "https://api.vimeo.com"
    HEADERS = { "Authorization" => "bearer #{ENV['VIMEO_ACCESS_TOKEN']}" }
    # include HTTParty
    # base_uri 'api.vimeo.com'

    attr_reader :uri, :name, :link
    attr_accessor :subscribed

    def initialize(user_hash)
      @uri = user_hash["uri"]
      @name = user_hash["name"]
      @link = user_hash["link"]
      @subscribed = false
    end

    def self.find_by_name(user_name, page=1)
      query = { query: user_name, page: page, fields: "uri,name,link" }

      response = HTTParty.get("#{BASE_URI}/users", query: query, headers: HEADERS)
      parsed_response = JSON.parse(response)

      user_object_array = Array.new
      parsed_response["data"].each do |hash|
        user_object_array << self.new(hash)
      end

      return user_object_array
    end

    def self.get_user_videos(user_uri, page=1)
      query = "fields=name,description,embed"

      response = HTTParty.get("#{BASE_URI}/#{user_uri}/videos?#{query}", headers: HEADERS)
      parsed_response = JSON.parse(response)

    end

  end
end
