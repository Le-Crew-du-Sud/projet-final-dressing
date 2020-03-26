class Condition < ApplicationRecord

  has_many :attires, foreign_key: "condition_id"
end
