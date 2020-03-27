class City < ApplicationRecord

  has_many :users, foreign_key: "city_id"
end
