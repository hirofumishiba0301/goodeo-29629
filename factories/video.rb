FactoryBot.define do
  factory :video do
    name {Faker::Name.last_name}
    info {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 7) }
    association :user
    association :tumbnail

    after(:build) do |video|
      video.movie.attach(io: File.open('public/images/test.mov'),filename: 'test.mov')
    end
  end
end