FactoryBot.define do
  factory :merit do
    title { Faker::Lorem.characters(number: 10) }
    user
  end
end