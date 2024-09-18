require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  it '全ての項目が存在すれば保存できること' do
    expect(@shipping_address).to be_valid
  end

  it '郵便番号が空では保存できないこと' do
    @shipping_address.postal_code = nil
    expect(@shipping_address).to_not be_valid
  end

  it '郵便番号が「3桁ハイフン4桁」の半角文字列でなければ保存できないこと' do
    @shipping_address.postal_code = '1234567'
    expect(@shipping_address).to_not be_valid
  end

  it '郵便番号が「3桁ハイフン4桁」の半角文字列でなければ保存できないこと' do
    @shipping_address.postal_code = '123-456'
    expect(@shipping_address).to_not be_valid
  end

  it '都道府県が空では保存できないこと' do
    @shipping_address.prefecture = nil
    expect(@shipping_address).to_not be_valid
  end

  it '市区町村が空では保存できないこと' do
    @shipping_address.city = nil
    expect(@shipping_address).to_not be_valid
  end

  it '番地が空では保存できないこと' do
    @shipping_address.address = nil
    expect(@shipping_address).to_not be_valid
  end

  it '電話番号が空では保存できないこと' do
    @shipping_address.phone_number = nil
    expect(@shipping_address).to_not be_valid
  end

  it '電話番号が10桁以上11桁以内の半角数値でなければ保存できないこと' do
    @shipping_address.phone_number = '090-1234-5678'
    expect(@shipping_address).to_not be_valid
  end
end
