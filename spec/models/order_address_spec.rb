require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品の購入ができる場合' do
      it 'address_line2以外が正しく存在すれば登録できる' do
      expect(@order_address).to be_valid
      end

      it 'shipping_area_idが0以外であれば登録できる' do
        @order_address.shipping_area_id = rand(1..47)
        expect(@order_address).to be_valid
      end

    end

    context '新規登録できない場合' do
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_line1が空では登録できない' do
        @order_address.address_line1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line1 can't be blank")
      end
      
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'shipping_area_idが0では登録できない' do
        @order_address.shipping_area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'postal_codeにハイフンが含まれていないと無効であること' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code imput correctly")
      end

      it 'postal_codeが「3桁-4桁」の形式でないと無効であること' do
        @order_address.postal_code = '12-34567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code imput correctly")
      end

      it 'postal_codeに全角数字が含まれていると無効であること' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code imput correctly")
      end

      it 'phone_numberが9桁以下では無効であること' do
        @order_address.phone_number = Faker::Number.leading_zero_number(digits: 9)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number imput correctly")
      end

      it 'phone_numberが12桁以上では無効であること' do
        @order_address.phone_number = Faker::Number.leading_zero_number(digits: 12)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number imput correctly")
      end

      it 'phone_numberにハイフンが含まれていると無効であること' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number imput correctly")
      end

      it 'phone_numberに全角数字が含まれていると無効であること' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number imput correctly")
      end

    end

  end
end