class Attire < ApplicationRecord
  #activestorage
  has_many_attached :pictures

  belongs_to :situation, class_name: "Situation"
  belongs_to :condition, class_name: "Condition"
  belongs_to :category, class_name: "Category"
  belongs_to :brand, class_name: "Brand"
  belongs_to :colour, class_name: "Colour"
  belongs_to :fabric, class_name: "Fabric"
  belongs_to :size, class_name: "Size"
  belongs_to :owner, class_name: "User"

end

=begin # create_table "attires"
  t.string "title", default: "", null: false
  t.text "description", default: "", null: false
  t.float "price", default: 0.0, null: false
  t.bigint "category_id"
  t.bigint "size_id"
  t.bigint "colour_id"
  t.bigint "fabric_id"
  t.bigint "situation_id"
  t.bigint "condition_id"
  t.bigint "brand_id"
  t.bigint "owner_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["brand_id"], name: "index_attires_on_brand_id"
  t.index ["category_id"], name: "index_attires_on_category_id"
  t.index ["colour_id"], name: "index_attires_on_colour_id"
  t.index ["condition_id"], name: "index_attires_on_condition_id"
  t.index ["fabric_id"], name: "index_attires_on_fabric_id"
  t.index ["owner_id"], name: "index_attires_on_owner_id"
  t.index ["situation_id"], name: "index_attires_on_situation_id"
  t.index ["size_id"], name: "index_attires_on_size_id"
=end
