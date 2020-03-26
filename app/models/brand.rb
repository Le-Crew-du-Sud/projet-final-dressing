class Brand < ApplicationRecord

  has_many :attires, foreign_key: "brand_id"
end
=begin # table "brands"
  t.string "trademark", default: "", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false

=end
