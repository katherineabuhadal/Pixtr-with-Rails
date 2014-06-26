class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :image_id, null: false
      t.integer :tag_id, null: false
    end
    add_index :taggings, [:image_id, :tag_id], unique: true
  end
end
