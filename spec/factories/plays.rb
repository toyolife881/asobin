FactoryBot.define do
  factory :play do
    play_name                 { Faker::Commerce.product_name }
    preparation               { Faker::Lorem.sentence }
    how_to_play               { Faker::Lorem.sentence }
    play_category_id          { Faker::Number.within(range: 2..10) }
    target_age_id             { Faker::Number.within(range: 2..9) }
    estimated_time_id         { Faker::Number.within(range: 2..6) }
    association :user

    after(:build) do |play|
      play.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
