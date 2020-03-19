class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :measure, null: false, default: ""

      t.timestamps
    end
  end
end
