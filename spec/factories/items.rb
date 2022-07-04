FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {'2'}
    item_status_id {'3'}
    price {'3'}
    delivery_fee_id {'3'}
    address_region_id {'3'}
    send_time_id {'3'}
    association :user 
  end
end