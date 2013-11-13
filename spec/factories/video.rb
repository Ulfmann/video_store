FactoryGirl.define do
  factory :video do
    title 'The Rspec Video'
    association :producer
  end
end
