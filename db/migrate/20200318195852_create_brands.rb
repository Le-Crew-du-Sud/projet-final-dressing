class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :trademark, null: false, default: ""

      t.timestamps
    end
  end
end
