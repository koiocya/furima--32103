require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品ができる' do
    ログイン状態のユーザーだけが、商品出品ページへ遷移できること

end
