class Attire < ApplicationRecord
  #activestorage
  has_many_attached :pictures
  # validate :image_type

  belongs_to :situation
  belongs_to :condition
  belongs_to :category
  belongs_to :brand
  belongs_to :colour
  belongs_to :fabric
  belongs_to :size
  belongs_to :user, foreign_key: :owner_id

  private
  # def image_type
  #   if pictures.attached? == false
  #     errors.add(:pictures, "are missing")
  #   else
  #     pictures.each do |image|
  #       if !image.content_type.in?(%('image/jpeg image/png'))
  #         errors.add(:pictures, "needs to be a JPEG or PNG")
  #       end
  #     end
  #   end
  # end
end
