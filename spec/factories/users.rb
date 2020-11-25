FactoryBot.define do
  factory :user do
    nickname              { 'ahiru' }
    email                 { 'test@example' }
    password              { 'a000000' }
    password_confirmation { password }
    first_name            { '田中' }
    first_name_reading    { 'タナカ' }
    last_name             { '太郎' }
    last_name_reading { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
