class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  validates :explain, :name, :price, :user, presence: true

  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
