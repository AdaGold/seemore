class Handle < ActiveRecord::Base
  has_many :media
  has_and_belongs_to_many :users

  def self.search(query)
  end

  def fetch_user(user)
    @user = $twitter.user(user)
  end
end
