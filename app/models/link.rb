class Link < ApplicationRecord

  belongs_to :linker, class_name: "User"

end
=begin # table "links"
  t.string "affinity", default: "", null: false
  t.bigint "linker_id"
  t.bigint "linked_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["linked_id"], name: "index_links_on_linked_id"
  t.index ["linker_id"], name: "index_links_on_linker_id"

=end
