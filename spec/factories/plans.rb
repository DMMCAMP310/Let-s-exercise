FactoryBot.define do
  factory :plan do
    title { Faker::Lorem.characters(number: 10) }
    user
  end
end