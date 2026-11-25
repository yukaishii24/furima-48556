FactoryBot.define do
  factory :order_address do

    postal_code               {"#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    shipping_area_id          {rand(1..47)}
    city                      {Faker::Address.city }
    address_line1             {Faker::Address.street_address }
    phone_number              {"0#{Faker::Number.number(digits: Faker::Number.between(from: 9, to: 10))}" }
    token                     {"tok_#{Faker::Alphanumeric.alphanumeric(number: 28)}" }
    
  end
end
