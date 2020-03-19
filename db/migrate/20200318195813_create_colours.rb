class CreateColours < ActiveRecord::Migration[5.2]
  def change
    create_table :colours do |t|
      t.string :tint, null: false, default: ""

      t.timestamps
    end
  end
end
