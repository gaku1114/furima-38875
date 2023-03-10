FactoryBot.define do
  factory :item do
    name           { Faker::Lorem.characters(number: 10) }
    description    { Faker::Lorem.sentence }
    category_id    { Faker::Number.between(from: 2, to: 11) }
    condition_id   { Faker::Number.between(from: 2, to: 7) }
    postage_id     { Faker::Number.between(from: 2, to: 3) }
    deadline_id    { Faker::Number.between(from: 2, to: 4) }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    price          { Faker::Number.number(digits: 5) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
