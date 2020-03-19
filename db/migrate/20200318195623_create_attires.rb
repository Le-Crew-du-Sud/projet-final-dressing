class CreateAttires < ActiveRecord::Migration[5.2]
  def change
    create_table :attires do |t|
      t.string :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.float :price, null: false, default: 0.00
      t.references :category, index:true
      t.references :size, index:true
      t.references :colour, index:true
      t.references :fabric, index:true
      t.references :situation, index:true
      t.references :condition, index:true
      t.references :brand, index:true
      t.references :owner, index:true

      t.timestamps
    end
  end
end
