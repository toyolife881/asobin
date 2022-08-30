FactoryBot.define do
  factory :user do
    transient do
      gimei_name { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { gimei_name.last.kanji }
    first_name            { gimei_name.first.kanji }
    last_name_kana        { gimei_name.last.katakana }
    first_name_kana       { gimei_name.first.katakana }
    birth_day             { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }


    trait :user_with_child_ages do
      after(:build) do |user|
        user.child_ages << build(:child_age)
      end
    end

  end
end