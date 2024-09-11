class AddPrefectureToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :prefecture, :string
  end
end
