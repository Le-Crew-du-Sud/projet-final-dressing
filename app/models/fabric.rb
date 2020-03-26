class Fabric < ApplicationRecord

  has_many :attires, foreign_key: "fabric_id"
end
