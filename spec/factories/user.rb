FactoryBot.define do
  factory :user, aliases: [:owner] do
    email { Faker::Internet.email }
    password { "qwerty" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number_with_country_code }
    role { "basic" }
    company
  end
end