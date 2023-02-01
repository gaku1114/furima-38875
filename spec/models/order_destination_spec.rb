require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end
  describe '商品購入機能' do
    context '商品購入に成功する' do
      it 'すべての項目が存在すれば商品を購入できる' do
        expect(@order_destination).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '商品を購入できない' do
      it 'userが紐づいていないと購入できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと購入できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空だと購入できない' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは「3桁ハイフン4桁」の形のみ保存可能' do
        @order_destination.postal_code = 1_234_567
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが1以上でないと購入できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @order_destination.phone_number = 123_456_789
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'phone_numberが12桁以上では購入できない' do
        @order_destination.phone_number = 123_456_789_123
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'phone_numberに半角数字以外が含まれている場合は購入できない' do
        @order_destination.phone_number = "090-1234-5678"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid.')
      end


      it 'tokenが空だと購入できない' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
