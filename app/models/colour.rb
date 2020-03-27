class Colour < ApplicationRecord

  has_many :attires, foreign_key: "colour_id"
end
