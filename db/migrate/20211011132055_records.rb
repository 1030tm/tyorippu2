class Records < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :page_tags, :pages
    remove_foreign_key :page_tags, :tags
    remove_column :tags, :tag_name, :string
    remove_index :page_tags, :page_id
    remove_index :page_tags, :tag_id
    remove_column :page_tags, :tag_id, :bigint
    remove_column :page_tags, :page_id, :bigint

    drop_table :page_tags
    drop_table :tags
  end
end
