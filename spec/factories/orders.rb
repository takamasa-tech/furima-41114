FactoryBot.define do
  factory :order do
    user { create(:user) } # Userとの関連付け
    item { create(:item) } # Itemとの関連付け
    credit_card { '1234567890123456' } # 16桁の数字
    token { "tok_#{Faker::Alphanumeric.alphanumeric(number: 10)}" } # ランダムなtokenを設定
  end
end
