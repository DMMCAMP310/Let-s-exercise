FactoryBot.define do
  factory :notification do
    action { "" }
    checked { Faker::Boolean.boolean }
    training
    chat_id {}
    association :visiter
    association :visited
  end
end