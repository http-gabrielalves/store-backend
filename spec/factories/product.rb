FactoryBot.define do
    factory :product do
        name { Faker::Lorem.word }
        image { Faker::Lorem.word }
        description { Faker::Lorem.word }
        category { Faker::Lorem.word }
        unit { Faker::Lorem.word }
        stocked { Faker::Number.number(10) }
        price { Faker::Number.decimal(2) }
    end
    end