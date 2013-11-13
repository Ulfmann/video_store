require 'spec_helper'

describe Subscription do
  it 'belongs to a user' do
    subscription = FactoryGirl.create :subscription
    subscription.user.should_not be nil
  end

end
