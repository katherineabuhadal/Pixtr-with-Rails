class AddColumnsToLikesTable < ActiveRecord::Migration
  def up
    add_column :likes, :likeable_type, :string, null: false
    add_column :likes, :likeable_id, :integer, null: false
  remove_column :likes, :image_id
  end

  def down
    remove_column :likes, :likeable_type, :string
    remove_column :likes, :likeable_id, :integer
  add_column :likes, :image_id, :integer
  end
end
