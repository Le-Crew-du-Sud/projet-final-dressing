class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.string :lender
      t.string :borrower
      t.integer :attire_id
      t.datetime :start_date
      t.integer :duration

      t.timestamps
    end
  end
end
