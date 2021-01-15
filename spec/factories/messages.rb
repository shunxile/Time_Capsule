FactoryBot.define do
  factory :message do
    association :user
    after(:build) do |message_tag|
      message_tag.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    after(:build) do |message_tag|
      message_tag.video.attach(io: File.open('public/videos/test_video.mp4'), filename: 'test_video.mp4')
    end
  end
end
