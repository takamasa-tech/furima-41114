FactoryBot.define do
  factory :shipping_address do
    postal_code { '123-4567' }
    prefecture { '東京都' }
    city { '渋谷区' }
    address { '神南1-1-1' }
    building_name { '渋谷ハイツ' }
    phone_number { '09012345678' }
    order
  end
end
