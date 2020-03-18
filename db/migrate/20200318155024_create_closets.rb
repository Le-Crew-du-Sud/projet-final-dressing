class CreateClosets < ActiveRecord::Migration[5.2]
  def change
    create_table :closets do |t|
      t.string :drawer
      t.integer :user_id

      t.timestamps
    end
  end
end
