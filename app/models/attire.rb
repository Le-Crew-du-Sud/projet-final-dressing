class Attire < ApplicationRecord
  #activestorage
  has_many_attached :itempicture

  belongs_to :situation
  belongs_to :condition
  belongs_to :category
  belongs_to :brand
  belongs_to :colour
  belongs_to :fabric
  belongs_to :size
  belongs_to :user, foreign_key: :owner_id
end
