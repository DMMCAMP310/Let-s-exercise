FactoryBot.define do
  factory :training do
    name { Faker::Lorem.characters(number: 10) }
    goal { Faker::Lorem.characters(number: 10) }
    introduction { Faker::Lorem.characters(number: 30) }
    user
  end
end
