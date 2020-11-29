class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_code, :city, :house_number, :building_name, :phone_number,:order_id, :prefecture_id, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code
    validates :city
    validates :house_number
    validates :phone_number
    # validates :card_number, :card_exp_month, :card_exp_year, :ard_cvc
    # validates :authenticity_token
  end
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "number Input only number"}
   #郵便番号に関するバリデーション
   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "code Input correctly"}
   #都道府県に関するバリデーション
   validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  def save
   
    # 購入の情報を保存
    Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, post_code: post_code, prefecture_id: prefecture_id, order_id: order_id)
  
    
  end
end