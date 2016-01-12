FactoryGirl.define do
  factory :handle do
    name "houglande"
    uri "https://twitter.com/sferik"
    provider "twitter"
  end

  factory :user1, class: User do
    name "daphne"
  end

  factory :user2, class: User do
    name "wakkawakka"
  end

  factory :medium do
    handle
    uri "link"
    embed "link"
    posted_at Time.now
  end

  factory :identity do
    uid "1234"
    provider "twitter"
    user_id 1
  end
end
