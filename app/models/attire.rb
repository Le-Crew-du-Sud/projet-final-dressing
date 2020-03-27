class Attire < ApplicationRecord
  #activestorage
  has_many_attached :pictures
  
  validates :title,
  presence: true,
  length: { minimum: 3, maximum: 14, message: "title should be within 3 and 14 characters" }

  belongs_to :situation, class_name: "Situation"
  belongs_to :condition, class_name: "Condition"
  belongs_to :category, class_name: "Category"
  belongs_to :brand, class_name: "Brand"
  belongs_to :colour, class_name: "Colour"
  belongs_to :fabric, class_name: "Fabric"
  belongs_to :size, class_name: "Size"
  belongs_to :owner, class_name: "User"

  has_many :carts, foreign_key: "attire_id"

end
