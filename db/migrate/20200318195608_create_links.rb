class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :affinity, null: false, default: ""
      t.references :linker, index:true
      t.references :linked, index:true

      t.timestamps
    end
  end
end
