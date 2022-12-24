FactoryBot.define do
    factory :user do
        name { Faker::Lorem.word }
        created { Faker::Date.backward }
        address { Faker::Lorem.word }
        picture { Faker::Lorem.word }
        email { Faker::Lorem.word }
    end
    end
