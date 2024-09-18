FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    city { '渋谷区' }
    address { '青山1-1-1' }
    house_number { '青山マンション101' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    prefecture_id { 2 }
  end
end
