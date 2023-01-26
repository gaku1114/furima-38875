FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.email }
    password               { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation  { password }
    first_name             { Gimei.first.kanji }   
    last_name              { Gimei.last.kanji }
    first_name_kana        { Gimei.first.katakana }
    last_name_kana         { Gimei.last.katakana }
    birthday               { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
