class AddCityToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :postal_code, :string
    add_column :shipping_addresses, :prefecture, :string
    add_column :shipping_addresses, :city, :string
    add_column :shipping_addresses, :address, :string
    add_column :shipping_addresses, :phone_number, :string
    add_column :orders, :credit_card, :string
    add_column :orders, :token, :string
    add_column :shipping_addresses, :order_id, :integer
  end
end
