FactoryBot.define do
  factory :user_child_age do
    
    association :user
    association :child_age
    
  end
end