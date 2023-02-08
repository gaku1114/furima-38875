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
        expect(@order_destination.errors.full_messages).to include("Userを入力してください")
      end

      it 'itemが紐づいていないと購入できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Itemを入力してください")
      end

      it 'postal_codeが空だと購入できない' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'postal_codeは「3桁ハイフン4桁」の形のみ保存可能' do
        @order_destination.postal_code = 1_234_567
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('郵便番号が無効です ハイフンを入力してください')
      end

      it 'prefecture_idが1以上でないと購入できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("都道府県を選択してください")
      end

      it 'cityが空だと購入できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空だと購入できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空だと購入できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @order_destination.phone_number = 123_456_789
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('電話番号が無効です')
      end

      it 'phone_numberが12桁以上では購入できない' do
        @order_destination.phone_number = 123_456_789_123
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('電話番号が無効です')
      end

      it 'phone_numberに半角数字以外が含まれている場合は購入できない' do
        @order_destination.phone_number = "090-1234-5678"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('電話番号が無効です')
      end


      it 'tokenが空だと購入できない' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('カード情報を入力してください')
      end
    end
  end
end
