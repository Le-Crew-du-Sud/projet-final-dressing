class Situation < ApplicationRecord

  has_many :attires, foreign_key: "situation_id"
end
