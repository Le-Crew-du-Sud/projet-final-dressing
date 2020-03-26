class Category < ApplicationRecord

  has_many :attires, foreign_key: "category_id"
end
=begin # table "categories"
  t.string "kind", default: "", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false

=end
