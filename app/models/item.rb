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

  # itemのバリデーション
  validates :explain, :name, :price, :image, presence: true

  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1, message: 'Select' }
  # validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number"}
  validates :price, numericality: { greater_than: 299, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
