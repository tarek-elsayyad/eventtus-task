FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    mobile {Faker::Number.number(10)}
  end
end
