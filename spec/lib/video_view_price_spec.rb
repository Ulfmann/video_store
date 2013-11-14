require 'spec_helper'
load './lib/video_view_price.rb'

describe VideoViewPrice do
  it 'finds the video_view' do
    sub = FactoryGirl.create(:subscription, price: 10)
    vv = FactoryGirl.create :video_view, subscription: sub
    VideoViewPrice.new(vv.id).video_view.should eq vv
  end
end
