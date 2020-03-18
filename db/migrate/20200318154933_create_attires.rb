class CreateAttires < ActiveRecord::Migration[5.2]
  def change
    create_table :attires do |t|
      t.integer :category_id
      t.integer :size_id
      t.integer :colour_id
      t.integer :fabric_id
      t.integer :status_id
      t.integer :condition_id
      t.float :price
      t.integer :brand_id
      t.integer :user_id
      t.integer :closet_id

      t.timestamps
    end
  end
end
