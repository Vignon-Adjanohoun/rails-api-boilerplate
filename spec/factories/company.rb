FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    phone { Faker::PhoneNumber.phone_number_with_country_code }
    email { Faker::Internet.email }
  end
end
