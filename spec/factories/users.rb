FactoryBot.define do
  factory :user do
    nickname              {"O-DAIKI"}
    email                 {"O-DAIKI@gmail.com"}
    password              {"od1234"}
    password_confirmation {password}
  end
end