class RenameTypeToCagegory < ActiveRecord::Migration[6.1]
  def change
    rename_column :gears, :type, :category 
  end
end
