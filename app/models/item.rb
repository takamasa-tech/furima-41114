class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  has_one :order

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

                    def sold_out?
                      order.present?
                    end
end

