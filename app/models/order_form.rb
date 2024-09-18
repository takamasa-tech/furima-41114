class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name,
                :phone_number, :addresses, :order_id

  # バリデーションの定義
  validates :user_id, :item_id, presence: true
  validates :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end

public

def process_order
  ActiveRecord::Base.transaction do
    order = Order.create!(user_id: user_id, item_id: item_id, token: token)
    ShippingAddress.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,

                    phone_number: phone_number, order_id: order.id)


  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
   amount: price,
   card: token,
   currency: 'jpy'
  )
end

end
