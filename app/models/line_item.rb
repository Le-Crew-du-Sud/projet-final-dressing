class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :attire
end
