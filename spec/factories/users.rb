FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    last_name_kana        {"アアア"}
    first_name_kana       {"エエエ"}
    birth_date            {Faker::Date.between(from: '1930-1-1', to: '2016-12-31')}
  end
end
