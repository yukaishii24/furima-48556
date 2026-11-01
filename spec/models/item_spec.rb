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

      context 'idが0以外の場合' do
        it 'category_idが0以外であれば登録できること' do
          @item.category_id = rand(1..10)
          expect(@item).to be_valid
        end

        it 'condition_idが0以外であれば登録できること' do
          @item.condition_id = rand(1..6)
          expect(@item).to be_valid
        end
      
        it 'shipping_fee_burden_idが0以外であれば登録できること' do
          @item.shipping_fee_burden_id = [1, 2].sample
          expect(@item).to be_valid
        end

        it 'shipping_area_idが0以外であれば登録できること' do
          @item.shipping_area_id = rand(1..47)
          expect(@item).to be_valid
        end

        it 'shipping_day_idが0以外であれば登録できること' do
          @item.shipping_day_id= [1, 2, 3].sample
          expect(@item).to be_valid
        end
      end
    
      it '価格が300円～9999999円であれば登録できること' do
        @item.price = Faker::Number.between(from: 300, to: 9_999_999)
        expect(@item).to be_valid
      end
    end
  
  end
end