FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {'2'}
    item_status_id {'3'}
    price {'300'}
    delivery_fee_id {'3'}
    address_region_id {'3'}
    send_time_id {'3'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end