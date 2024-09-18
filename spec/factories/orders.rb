FactoryBot.define do
  factory :order do
    credit_card { '1234567890123456' }
    token { "tok_#{Faker::Alphanumeric.alphanumeric(number: 10)}" } 
  end
end
