FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 2) }
    description      { Faker::Lorem.characters(number: 40) }
    selling_price    { '300' }
    detail_id        { '2' }
    state_id         { '2' }
    sipping_cost_id  { '2' }
    prefecture_id    { '2' }
    sipping_day_id   { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
