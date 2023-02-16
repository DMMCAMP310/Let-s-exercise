FactoryBot.define do
  factory :chat do
    message { Faker::Lorem.characters(number: 20) }
    user
    room
  end
end