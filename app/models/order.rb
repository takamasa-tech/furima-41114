class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

  validates :token, presence: true
  validates :credit_card, format: { with: /\A\d{16}\z/ }
end
