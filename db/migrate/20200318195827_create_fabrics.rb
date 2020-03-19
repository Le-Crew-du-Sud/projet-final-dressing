class CreateFabrics < ActiveRecord::Migration[5.2]
  def change
    create_table :fabrics do |t|
      t.string :variety, null: false, default: ""

      t.timestamps
    end
  end
end
