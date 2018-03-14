FactoryBot.define do
  factory :trip do
    starting_time { Faker::Time.forward(23, :morning).to_i }
    starting_address { Faker::Address.street_address }
    starting_latitude { Faker::Address.latitude }
    starting_longitude { Faker::Address.longitude }
  end
end
