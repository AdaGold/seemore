FactoryGirl.define do
  factory :handle do
    name "houglande"
    uri "https://twitter.com/sferik"
    provider "twitter"
  end

  factory :medium do
    handle
    uri "link"
    embed "link"
    posted_at Time.now
  end
end
