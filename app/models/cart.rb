class Cart < ApplicationRecord
  # belongs_to :user
    belongs_to :customer, class_name: "User"
    belongs_to :attire, class_name: "Attire"
end
=begin # table "carts"
  t.float "sale_price", default: 0.0, null: false
  t.bigint "customer_id"
  t.bigint "attire_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["attire_id"], name: "index_carts_on_attire_id"
  t.index ["customer_id"], name: "index_carts_on_customer_id"

=end
