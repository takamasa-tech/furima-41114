class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :token, :postal_code, :prefecture_id, :city, :house_number,
                :phone_number, :address

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :token
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture, numericality: { other_than: 1 }
  validates :city
  validates :address
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

def save
  order = Order.create(user_id: user_id, item_id: item_id)
  ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                          phone_number: phone_number, address: address, order_id: order.id)
end

end
