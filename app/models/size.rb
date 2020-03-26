class Size < ApplicationRecord

  has_many :attires, foreign_key: "size_id"
end
=begin # table "sizes"
  t.string "measure", default: "", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false

=end
