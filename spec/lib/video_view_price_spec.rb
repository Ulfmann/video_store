require 'spec_helper'
load './lib/video_view_price.rb'

describe VideoViewPrice do
  let(:sub) { FactoryGirl.create(:subscription, price: 10) }
  let(:vv) { FactoryGirl.create :video_view, subscription: sub }

  it 'finds the video_view' do
    sub =     vv =     VideoViewPrice.new(vv.id).video_view.should eq vv
  end
end
