class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :sold_price, null: false, default: 0.00
      t.string :stripe_customer_id, null: false, default: ""

      t.timestamps
    end
  end
end
