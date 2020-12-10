FactoryBot.define do
  factory :music do
    artist {Faker::Lorem.sentence}
    title {Faker::Lorem.sentence}
    association :user
  end
end
