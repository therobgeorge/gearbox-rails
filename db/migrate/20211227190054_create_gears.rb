class CreateGears < ActiveRecord::Migration[6.1]
  def change
    create_table :gears do |t|
      t.integer :user_id
      t.string :type
      t.string :make
      t.string :model
      t.string :color
      t.string :serial_number
      t.string :other_info
      t.boolean :missing
      t.boolean :registered

      t.timestamps
    end
  end
end
