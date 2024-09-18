require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  context '登録できる場合' do
    it '全ての項目が存在すれば保存できること' do
      expect(@order_form).to be_valid
    end

    it '建物名が空でも購入できること' do
      @order_form. house_number = nil
      expect(@order_form).to be_valid
    end
  end

 context '登録できない場合' do
    it 'user_idが空だと登録できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと登録できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenが空だと登録できない' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form).to_not be_valid
    end

    it '電話番号が9桁以下では登録できないこと' do
      @order_form.phone_number = '123456789'
      @order_form.valid?
      expect(@order_form).to_not be_valid
    end

    it '電話番号が12桁以上では登録できないこと' do
      @order_form.phone_number = '123456789012'
      @order_form.valid?
      expect(@order_form).to_not be_valid
    end

    it '電話番号に半角数字以外が含まれている場合、登録できないこと' do
      @order_form.phone_number = '090-1234-5678'
      @order_form.valid?
      expect(@order_form).to_not be_valid
    end

    it '郵便番号にハイフンがないと登録できないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form).to_not be_valid
    end

    it '全ての情報が存在すれば保存できること' do
      expect(@order_form).to be_valid
    end

    it '郵便番号が空だと登録できない' do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県が空だと登録できない' do
      @order_form.prefecture_id = nil
      @order_form.valid?
      expect(@order_form.
      errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県が1だと登録できない' do
      @order_form.prefecture_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空だと登録できない' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと登録できない' do
      @order_form.address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空だと登録できない' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
