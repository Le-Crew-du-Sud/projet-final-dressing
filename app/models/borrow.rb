class Borrow < ApplicationRecord
  # set default value of start_date for today (source: https://stackoverflow.com/a/9092686/9439795 //answer 1)
  def after_initialize
    self.start_date ||= Date.today if new_record?
  end

  belongs_to :attire
  #belongs_to :user, through: :attire
  has_one :user
end
=begin # table "borrows"
  t.datetime "start_date", null: false
  t.integer "duration", default: 0, null: false
  t.bigint "lender_id"
  t.bigint "borrower_id"
  t.bigint "attire_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["attire_id"], name: "index_borrows_on_attire_id"
  t.index ["borrower_id"], name: "index_borrows_on_borrower_id"
  t.index ["lender_id"], name: "index_borrows_on_lender_id"

=end
