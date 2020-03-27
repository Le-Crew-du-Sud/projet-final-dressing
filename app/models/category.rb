class Category < ApplicationRecord

  has_many :attires, foreign_key: "category_id"
end
