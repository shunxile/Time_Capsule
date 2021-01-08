FactoryBot.define do
  factory :message do
    title {Faker::Lorem.sentence}
    message {Faker::Lorem.sentence}
    whom {Faker::Name.name}
    open_plan {Faker::Date.between(from: 1.day.from_now, to: 100.years.from_now).strftime('%Y-%m-%d')}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
