class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :town, null: false, default: ""

      t.timestamps
    end
  end
end
