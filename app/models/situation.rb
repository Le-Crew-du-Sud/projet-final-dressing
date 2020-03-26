class Situation < ApplicationRecord

  has_many :attires, foreign_key: "situation_id"
end
=begin # table "situations"
  t.string "scope", default: "", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false

=end
