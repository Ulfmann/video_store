require 'spec_helper'

describe User do
  it 'has a name' do
    User.create(name: "Bobby Muster").should be_valid
  end
end
