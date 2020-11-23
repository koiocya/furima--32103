FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    first_name {Faker::Name.first_name}
    first_name_reading {Faker::Name.first_name_kana}
    lastt_name {Faker::Name.last_name}
    birthday {Faker::Date.birthday}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end