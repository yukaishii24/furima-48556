require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '新規登録できる場合' do
      it 'すべての項目が正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'category_idが0以外であれば登録できる' do
        @item.category_id = rand(1..10)
        expect(@item).to be_valid
      end
      it 'condition_idが0以外であれば登録できる' do
        @item.condition_id = rand(1..6)
        expect(@item).to be_valid
      end    
      it 'shipping_fee_burden_idが0以外であれば登録できる' do
        @item.shipping_fee_burden_id = [1, 2].sample
        expect(@item).to be_valid
      end
      it 'shipping_area_idが0以外であれば登録できる' do
        @item.shipping_area_id = rand(1..47)
        expect(@item).to be_valid
      end
      it 'shipping_day_idが0以外であれば登録できる' do
        @item.shipping_day_id= [1, 2, 3].sample
        expect(@item).to be_valid
      end
    
      it 'priceが半角数字の300円～9999999円であれば登録できる' do
        @item.price = Faker::Number.between(from: 300, to: 9_999_999)
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'imageが空では登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'category_idが0では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが0では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_burden_idが0では登録できない' do
        @item.shipping_fee_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end
      it 'shipping_area_idが0では登録できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_day_idが0では登録できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円以下か9999999円以上では登録できない' do
        @item.price = [Faker::Number.between(from: 0, to: 300), Faker::Number.between(from: 9_999_999, to: 99_999_999)].sample
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが全角数字では登録できない' do
      @item.price = Faker::Base.numerify('###').tr('0-9', '０-９')
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが文字列では登録できない' do
      @item.price = Faker::Lorem.word
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'userが紐づいていない場合は登録できない' do
      @item = FactoryBot.build(:item, user: nil)
      expect(@item).to be_invalid
      end
    end
  end
end