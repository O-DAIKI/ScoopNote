# frozen_string_literal: true

FactoryBot.define do
  factory :music do
    image { "test.jpg" }
    file { "test.mp3" }
    artist { Faker::Lorem.sentence }
    title { Faker::Lorem.sentence }
    association :user
  end
end
