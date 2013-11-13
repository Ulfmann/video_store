FactoryGirl.define do
  factory :subscription do
    start_date Date.parse('01.01.2013')
    end_date Date.parse('01.05.2013')
    price 149.5
    association :user
  end
end
