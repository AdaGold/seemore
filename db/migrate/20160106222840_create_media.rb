class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url
      t.string :type

      t.timestamps null: false
    end
  end
end
