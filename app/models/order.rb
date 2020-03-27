class Order < ApplicationRecord

  has_many :carts, foreign_key: "order_id"
  has_many :customers, through: :carts
  has_many :attires, through: :carts
end
