FactoryBot.define do
  factory :item_order do
    # card_number { '42424242424242' }
    # card_exp_month {'12'}
    # card_exp_year { '23' }
    # ard_cvc { '123' }
    post_code { '123-4567' }
    prefecture_id      { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { "09010002000" }
  end
end
