class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.datetime :start_date, null: false
      t.integer :duration, null: false, default: 0
      t.references :lender, index:true
      t.references :borrower, index:true
      t.references :attire, index:true

      t.timestamps
    end
  end
end
