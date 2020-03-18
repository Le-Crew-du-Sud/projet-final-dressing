class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :city_id
      t.boolean :is_admin

      t.timestamps
    end
  end
end
