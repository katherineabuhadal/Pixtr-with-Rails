class CreateGroupImages < ActiveRecord::Migration
  def change
    create_table :group_images do |t|
      t.integer :group_id, null: false
      t.integer :image_id, null: false

      t.timestamps null: false 
    end
    add_index :group_images, [:group_id, :image_id], unique: true
  end
end
