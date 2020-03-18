class CreateAttires < ActiveRecord::Migration[5.2]
  def change
    create_table :attires do |t|
      t.string :title
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
