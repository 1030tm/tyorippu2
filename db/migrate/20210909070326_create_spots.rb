class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string             :spot_name, null: false
      t.string             :spot_address, null: false
      t.string             :spot_tel
      t.string             :spot_parking, null: false
      t.text               :spot_comment
      t.references         :page, null: false, foreign_key: true
      t.timestamps
    end
  end
end
