class Handle < ActiveRecord::Base
  has_many :media
  has_and_belongs_to_many :users

  def self.search(query)
    # response = HTTParty.get("https://api.twitter.com/1.1/users/search.json?q=#{user}&page=1&count=1")

    # from botsy: where("name LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
  end
end
