class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar

  validates :first_name, :last_name,
  presence: true,
  length: { minimum: 3, maximum: 14, message: "first and last_name should be within 3 and 14 characters each" }

  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "verify your email adress" }

  validates :password, presence: true, length: { minimum: 6, message: '6 caractères minimum! '}

  has_many :attires, foreign_key: "owner_id", dependent: :destroy
  has_many :borrows_in, foreign_key: "borrower_id"
  has_many :borrows_out, foreign_key: "lender_id"
  has_many :links_out, foreign_key: "linker_id"
  has_many :links_in, foreign_key: "linked_id"
  has_many :carts, foreign_key: "customer_id"
  has_many :orders, foreign_key: "customer_id"

  belongs_to :city, class_name: "City"

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
