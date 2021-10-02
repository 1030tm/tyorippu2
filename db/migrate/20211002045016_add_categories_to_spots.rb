class AddCategoriesToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :categories, :text
  end
end
