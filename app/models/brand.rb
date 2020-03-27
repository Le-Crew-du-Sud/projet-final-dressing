class Brand < ApplicationRecord

  has_many :attires, foreign_key: "brand_id"
end
