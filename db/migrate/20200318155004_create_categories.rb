class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :kind
      t.integer :fabric_id
      t.integer :size_id

      t.timestamps
    end
  end
end
