class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :price, presence: true
  validates :name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id,
            :image, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
