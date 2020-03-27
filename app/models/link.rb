class Link < ApplicationRecord

  belongs_to :linker, class_name: "User"
end
