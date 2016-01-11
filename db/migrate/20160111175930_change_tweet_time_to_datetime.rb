class ChangeTweetTimeToDatetime < ActiveRecord::Migration
  def change
    change_column :media, :tweet_time, :datetime
  end
end
