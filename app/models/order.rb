class Order < ApplicationRecord
  validates :first_name, :last_name, :address, :city,
  presence: true,
  length: { minimum: 3, message: "first and last_name, address and city should be at least 3 characters each" }

  validates :email,
  presence: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "verify your email adress" }

  has_many :carts, foreign_key: "order_id"
  has_many :customers, through: :carts
  has_many :attires, through: :carts
end
