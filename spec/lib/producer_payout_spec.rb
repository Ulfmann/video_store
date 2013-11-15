require 'spec_helper'
load './lib/producer_payout.rb'

describe ProducerPayout do
  let(:producer) { Producer.find_by_name('Steve') }
  let(:range) { Date.parse('01.08.2013')..Date.parse('31.08.2013') }
  let(:payout) { ProducerPayout.new(producer, range) }

  it 'knows producer and range' do
    payout.producer.should eq producer
    payout.range.should eq range
  end

  describe '#subscription_ids' do
    it 'returns subscription ids from watched videos of a producer' do
      payout.subscription_ids.should =~ [1,2,4]
    end
  end

  describe '#video_ids' do
    it 'returns the video_ids of a producer' do
      payout.video_ids.should eq [3,4,5]
    end
  end

  describe '#video_view_count' do
    it 'returns the click amount for a subscription' do
      sub = Subscription.find 2
      payout.video_view_count(sub).should eq 4

    end
  end

  describe '#subscription_view_price' do
    it 'returns a price per view' do
      sub = Subscription.find 2
      payout.subscription_view_price(sub).should eq 9.35625
    end
  end

  describe '#calculate' do
    it 'returns the total payout for a producer' do
      payout.calculate.should eq 20.28
    end
  end
end
