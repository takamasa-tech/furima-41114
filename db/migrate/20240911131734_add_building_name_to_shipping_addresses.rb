class AddBuildingNameToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :building_name, :string
  end
end
