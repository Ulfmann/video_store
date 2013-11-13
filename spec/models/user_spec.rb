require 'spec_helper'

describe User do

  subject { User.create(name: 'Bobby Muster') }

  it 'has a name' do
    subject.should be_valid
    User.create().should have(1).error_on :name
  end

  it 'has subscriptions' do
    subject.subscriptions << Subscription.create
  end
end
