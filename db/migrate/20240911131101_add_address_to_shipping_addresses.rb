class AddAddressToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :address, :string
  end
end
