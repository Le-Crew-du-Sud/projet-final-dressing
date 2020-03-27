class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.float :sale_price, null: false, default: 0.00
      t.references :customer, index:true
      t.references :attire, index:true
      t.references :order, index:true

      t.timestamps
    end
  end
end
