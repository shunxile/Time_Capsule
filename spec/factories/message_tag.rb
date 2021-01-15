FactoryBot.define do
  factory :message_tag do
    title {Faker::Lorem.sentence}
    message {Faker::Lorem.sentence}
    whom {Faker::Name.name}
    open_plan {Faker::Date.between(from: 1.day.from_now, to: 100.years.from_now).strftime('%Y-%m-%d')}
    name {Faker::Lorem.sentence}

  end
end
