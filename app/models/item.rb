class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :explain, :name, :price, :user, prsence: true

  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericlity: { other_than: 1 }

end
