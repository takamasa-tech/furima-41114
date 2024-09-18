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
      expect(@order_form).to_not be_valid
    end

    it 'item_idが空だと登録できない' do
      @order_form.item_id = nil
      expect(@order_form).to_not be_valid
    end

    it 'tokenが空だと登録できない' do
      @order_form.token = nil
      expect(@order_form).to_not be_valid
    end

    it '電話番号が9桁以下では登録できないこと' do
      @order_form.phone_number = '123456789'
      expect(@order_form).to_not be_valid
    end

    it '電話番号が12桁以上では登録できないこと' do
      @order_form.phone_number = '123456789012'
      expect(@order_form).to_not be_valid
    end

    it '電話番号に半角数字以外が含まれている場合、登録できないこと' do
      @order_form.phone_number = '090-1234-5678'
      expect(@order_form).to_not be_valid
    end

    it 'クレジットカード情報が空では保存できないこと' do
      @order_form.credit_card = nil
      expect(@order_form).to_not be_valid
    end

    it '全ての情報が存在すれば保存できること' do
      @order_form.credit_card = '1234567890123456' # 16桁の数字
      expect(@order_form).to be_valid
    end
  end
end
