FactoryBot.define do
    factory :user do
        name { Faker::Lorem.word }
        address { Faker::Lorem.word }
        picture { Faker::Lorem.word }
        email { Faker::Lorem.word }
    end
    end
