class Link < ApplicationRecord

  belongs_to :user, as: :linker
  belongs_to :user, as: :linked

end
