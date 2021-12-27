class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :gear_id
      t.string :photo_url

      t.timestamps
    end
  end
end
