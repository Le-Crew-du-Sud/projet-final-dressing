class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.float :sale_price

      t.timestamps
    end
  end
end
