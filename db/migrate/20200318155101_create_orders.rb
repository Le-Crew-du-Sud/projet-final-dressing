class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :attire_id
      t.float :price
      t.integer :stripe_id
      t.datetime :order_date

      t.timestamps
    end
  end
end
