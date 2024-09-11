class AddPhoneNumberToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :phone_number, :string
  end
end
