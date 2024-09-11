require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it '全ての項目が存在すれば保存できること' do
    expect(@order).to be_valid
  end

  it 'クレジットカード情報が空では保存できないこと' do
    @order.credit_card = nil
    expect(@order).to_not be_valid
  end

  it '全ての情報が存在すれば保存できること' do
    @order.credit_card = '1234567890123456' # 16桁の数字
    expect(@order).to be_valid
  end

  it 'tokenが空では登録できないこと' do
    order = Order.new(token: nil)
    order.valid?
    expect(order.errors.full_messages).to include("Token can't be blank")
  end
end
