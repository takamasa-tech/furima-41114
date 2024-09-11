class AddCityToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :city, :string
  end
end
