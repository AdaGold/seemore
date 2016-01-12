FactoryGirl.define do
  factory :handle do
    name "houglande"
    uri "link"
    provider "twitter"
  end

  factory :user1, class: User do
    name "daphne"
  end

  factory :user2, class: User do
    name "wakkawakka"
  end

end
