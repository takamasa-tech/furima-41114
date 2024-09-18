class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

  validates :credit_card, :token, presence: true  
end
