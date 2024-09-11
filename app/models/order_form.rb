class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name,
                :phone_number

  # バリデーションの定義
  validates :user_id, :item_id, presence: true
  validates :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :addresses, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }

  # 保存のためのメソッド
  def save
    order = Order.create(user_id:, item_id:)
    ShippingAddress.create(postal_code:, prefecture_id:, city:, addresses:,
                           house_number:, building_name:, phone_number:, order_id: order.id)
  end
end
