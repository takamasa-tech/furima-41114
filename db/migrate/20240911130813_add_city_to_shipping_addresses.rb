class AddCityToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :postal_code, :string
    add_column :shipping_addresses, :prefecture_id, :integer
    add_column :shipping_addresses, :city, :string
    add_column :shipping_addresses, :address, :string
    add_column :shipping_addresses, :phone_number, :string
    add_column :shipping_addresses, :order_id, :integer
  end
end
