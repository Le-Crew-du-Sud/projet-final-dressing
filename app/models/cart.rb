class Cart < ApplicationRecord

    belongs_to :customer, class_name: "User"
    belongs_to :attire, class_name: "Attire"
end
