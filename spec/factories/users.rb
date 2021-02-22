FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birthday              { Faker::Date.in_date_period }
  end
end
