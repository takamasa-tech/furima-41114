class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :token, :postal_code, :prefecture_id, :city, :house_number,
                :phone_number, :addresses

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :token
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city
  validates :addresses
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
end

end
public

def process_order
  ActiveRecord::Base.transaction do
    order = Order.create!(user_id: user_id, item_id: item_id, token: token)
    ShippingAddress.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, house_number: house_number,

                    phone_number: phone_number, order_id: order.id)


  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
   amount: price,
   card: token,
   currency: 'jpy'
  )
end

end
