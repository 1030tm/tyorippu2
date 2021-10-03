class AddCategoryToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :category_id, :integer, null: false, default: 0
  end
end
