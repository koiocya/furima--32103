require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の保存' do
      context '商品が保存できる場合' do
        it '必要な情報を適切に入力すると、商品の出品ができること' do
          expect(@item).to be_valid
        end
      end
      
      context '商品が保存できない場合' do
        it '商品画像を1枚つけることが必須であること' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が必須であること' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が必須であること' do
          @item.explain = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Explain can't be blank")
        end
        it 'カテゴリーの情報が必須であること' do
          @item.category = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end
        it 'カテゴリーの情報(id:1)だと保存できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end
        it '商品の状態についての情報が必須であること' do
          @item.sales_status = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Sales status Select')
        end
        it '商品の状態についての情報(id:1)だと保存できない' do
          @item.sales_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Sales status Select')
        end
        it '配送料の負担についての情報が必須であること' do
          @item.shipping_fee_status = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping fee status Select')
        end
        it '配送料の負担についての情報(id:1)だと保存できない' do
          @item.shipping_fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping fee status Select')
        end
        it '発送元の地域についての情報が必須であること' do
          @item.prefecture = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture Select')
        end
        it '発送元の地域についての情報(id:1)だと保存できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture Select')
        end
        it '発送までの日数についての情報が必須であること' do
          @item.scheduled_delivery = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Scheduled delivery Select')
        end
        it '発送までの日数についての情報(id:1)だと保存できない' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Scheduled delivery Select')
        end
        it '価格についての情報が必須であること' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格の範囲が、¥300以上であること' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
        it '価格の範囲が、¥10_000_000未満であること' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
        it '販売価格は半角数字のみ保存可能であること' do
          @item.price = '５００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
      end
    end
  end
end
