class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar

  has_many :attires, foreign_key: "owner_id", dependent: :destroy
  has_many :borrows_in, foreign_key: "borrower_id"
  has_many :borrows_out, foreign_key: "lender_id"
  has_many :links_out, foreign_key: "linker_id"
  has_many :links_in, foreign_key: "linked_id"
  has_many :carts, foreign_key: "customer_id"
  has_many :orders, foreign_key: "customer_id"

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

=begin # table "users"
  t.string "first_name", default: "", null: false
  t.string "last_name", default: "", null: false
  t.text "about_me", default: "", null: false
  t.boolean "is_admin", default: false
  t.bigint "city_id"
  t.string "email", default: "", null: false
  t.string "encrypted_password", default: "", null: false
  t.string "reset_password_token"
  t.datetime "reset_password_sent_at"
  t.datetime "remember_created_at"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.string "provider"
  t.string "uid"
  t.index ["city_id"], name: "index_users_on_city_id"
  t.index ["email"], name: "index_users_on_email", unique: true
  t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

=end
