FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture { '東京都' }
    city { '渋谷区' }
    address { '青山1-1-1' }
    phone_number { '09012345678' }
  end
end
