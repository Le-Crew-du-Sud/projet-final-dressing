class Order < ApplicationRecord

  has_many :carts, foreign_key: "order_id"
end

=begin # table "orders"
  t.float "sold_price", default: 0.0, null: false
  t.string "stripe_customer_id", default: "", null: false
  t.bigint "customer_id"
  t.bigint "attire_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.string "first_name"
  t.string "last_name"
  t.string "country"
  t.string "address"
  t.string "postcode"
  t.string "city"
  t.string "province"
  t.string "phone_number"
  t.string "email"
  t.index ["attire_id"], name: "index_orders_on_attire_id"
  t.index ["customer_id"], name: "index_orders_on_customer_id"

=end
