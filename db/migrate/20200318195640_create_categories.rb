class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :kind, null: false, default: ""
      t.references :fabric, index:true
      t.references :size, index:true

      t.timestamps
    end
  end
end
