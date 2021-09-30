class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references      :user, foreign_key: true, null: false, unique: true
      t.references      :page, foreign_key: true, null: false, unique: true
      t.timestamps
    end
  end
end
