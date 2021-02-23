require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品登録' do
    context '出品登録できるとき' do

      it 'name,description,image,selling_price,detail_id,state_id,sipping_id,prefecture_id,sipping_day_idが存在している' do
        expect(@item).to be_valid
      end
      it 'selling_priceが300以上で半角数字であれば登録できる' do
        @item.selling_price = '300'
        expect(@item).to be_valid
      end
      it 'selling_priceが9999999以内で半角数字であれば登録できる' do
        @item.selling_price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '出品登録できない時' do

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank",
          "Selling price is invalid",
          "Selling price is too short (minimum is 3 characters)",
          "Selling price is not a number")
      end
      it 'detail_idが空では登録できない'do
        @item.detail_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank", "Detail is not a number")
      end
      it 'state_idが空では登録できない'do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank", "State is not a number")
      end
      it 'sipping_cost_idが空では登録できない'do
        @item.sipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping cost can't be blank", "Sipping cost is not a number")
      end
        it 'prefecture_idが空では登録できない'do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
        it 'sipping_day_idが空では登録できない'do
        @item.sipping_day_id = ''
        @item.valid?
      expect(@item.errors.full_messages).to include("Sipping day can't be blank", "Sipping day is not a number")
      end
      it 'imageが空では登録できない'do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'selling_priceが299以下では登録できない'do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than 299")
      end
      it 'selling_priceが10000000以下では登録できない'do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 10000000")
      end
      it 'selling_priceが半角英字では登録できない'do
        @item.selling_price = 'eeeeee'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is too short (minimum is 3 characters)",
        "Selling price is not a number")
      end
      it 'selling_priceが全角では登録できない'do
        @item.selling_price = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is too short (minimum is 3 characters)",
        "Selling price is not a number")
      end
    end
  end
end
