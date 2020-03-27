class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :kind, null: false, default: ""

      t.timestamps
    end
  end
end
