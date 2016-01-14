class MediaTime < ActiveRecord::Migration
  def change
    change_column :media, :posted_at, :datetime
  end
end
