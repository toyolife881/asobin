FactoryBot.define do
  factory :child_age do
    name           { Faker::Number.within(range: 1..12) }
  end
end