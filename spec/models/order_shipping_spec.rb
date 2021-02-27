require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
  end

  describe '購入商品の保存' do
    context '購入商品を保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '購入商品を保存できないとき' do
      it 'postal_codeが空だと保存できない' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できな' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと保存できない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numderが数値以外だと保存できない' do
        @order_shipping.phone_number = 'ああああああ'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numderが12桁以上だと保存できない' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
