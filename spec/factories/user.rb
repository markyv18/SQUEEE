FactoryGirl.define do
  factory :user do
    first_name "Boudy"
    last_name "Kitty"
    sequence :email do |n|
      "kitty#{n}@gmail.com"
    end
    phone "+18083667454"
    password "password"
    status 0
    role 0
    verification_code 123456

    factory :user_with_trips do
      transient do
        trips_count 2
      end

      after(:create) do |user, evaluator|
        create_list(:trip, evaluator.trips_count, user: user)
      end
    end

    factory :user_with_tours do
      transient do
        tours_count 6
      end

      after(:create) do |user, evaluator|
        create_list(:tour, evaluator.tours_count, user: user)
      end
    end
  end
end
