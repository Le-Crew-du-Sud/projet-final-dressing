class Cart < ApplicationRecord

    belongs_to :customer, class_name: "User"
    belongs_to :attire, class_name: "Attire"
    belongs_to :order, class_name: "Order", optional: true


end
