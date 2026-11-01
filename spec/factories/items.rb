FactoryBot.define do
  factory :item do

    name                      {Faker::Commerce.product_name }
    detail                    {Faker::Lorem.sentence }
    category_id               {rand(1..10) }
    condition_id              {rand(1..6) }
    shipping_fee_burden_id    {rand(1..2) }
    shipping_area_id          {rand(1..47)}
    shipping_day_id           {rand(1..3)}
    price                     {rand(300..9_999_999)}
    image                     { Rack::Test::UploadedFile.new(StringIO.new(Faker::Lorem.sentence), 'image/png', original_filename: 'test.png') }

    association :user
  end

end