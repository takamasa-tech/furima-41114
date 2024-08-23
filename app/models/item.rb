class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # さらに他のバリデーションを追加できます
end
