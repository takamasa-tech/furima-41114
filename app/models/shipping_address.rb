class ShippingAddress < ApplicationRecord
  belongs_to :order

  attribute :postal_code, :string
  attribute :prefecture_id, :integer
  attribute :city, :string
  attribute :house_number, :string
  attribute :phone_number, :string
  attribute :address, :string
end
