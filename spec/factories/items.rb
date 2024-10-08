FactoryBot.define do
  factory :item do
    association :user
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.png')) }
    name { Faker::Lorem.word }
    info { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_status_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
