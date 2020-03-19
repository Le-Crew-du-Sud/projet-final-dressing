class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attires, as: :owner, foreign_key: "owner_id"
  has_many :borrows, as: :borrower, foreign_key: "borrower_id"
  has_many :links, as: :linker, foreign_key: "linker_id"
  has_many :links, as: :linked, foreign_key: "linked_id"
  has_many :carts, as: :customer, foreign_key: "customer_id"
  has_many :orders, through: :carts, as: :customer, foreign_key: "customer_id"
end
