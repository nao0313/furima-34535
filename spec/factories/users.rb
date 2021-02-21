FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    last_name             { Faker::person.last.kanji }
    first_name            { Faker::person.first.kanji }
    last_name_kana        { Faker::person.last.katakana }
    first_name_kana       { Faker::person.first.katakana }
    birthday              { Faker::Date.in_date_period }
  end
end