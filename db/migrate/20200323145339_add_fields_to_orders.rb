class AddFieldsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :address, :string
    add_column :orders, :postcode, :string
    add_column :orders, :city, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :email, :string
    add_column :orders, :receipt, :string
  end
end
