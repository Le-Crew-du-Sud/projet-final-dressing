class Size < ApplicationRecord

  has_many :attires, foreign_key: "size_id"
end
