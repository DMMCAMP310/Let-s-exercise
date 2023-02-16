FactoryBot.define do
  factory :cause do
    title { Faker::Lorem.characters(number: 10) }
    user
  end
end