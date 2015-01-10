require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :workshop do
    name "Pottery class"
    description "Eat and make some pottery"
    date DateTime.now
    street "44 Leland Rd"
    city "Norfolk"
    state "MA"
    zip "02056"
  end
end
