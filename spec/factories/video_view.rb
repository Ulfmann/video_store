FactoryGirl.define do
  factory :video_view do
    association :user
    association :subscription
    association :video
    created_at Date.parse('01.01.2013')
  end
end
