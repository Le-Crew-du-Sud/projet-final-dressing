class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_many :attires, as: :owner, foreign_key: "owner_id"
  has_many :borrows, as: :borrower, foreign_key: "borrower_id"
  has_many :links, as: :linker, foreign_key: "linker_id"
  has_many :links, as: :linked, foreign_key: "linked_id"
  has_many :carts, as: :customer, foreign_key: "customer_id"
  has_many :orders, through: :carts, as: :customer, foreign_key: "customer_id"

  after_create :welcome_send

  # Comment configurer Devise et OmniAuth pour votre application Rails
  # source (étape 8): https://www.codeflow.site/fr/article/how-to-configure-devise-and-omniauth-for-your-rails-application#step-8-update-the-user-model
  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.first_name = auth.info.name.split.first
       user.last_name = auth.info.name.split.last
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
     end
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
