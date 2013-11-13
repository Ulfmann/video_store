require 'spec_helper'
load './lib/producer_payout.rb'

describe ProducerPayout do
  let(:producer) { Producer.new(name: 'Test Producer') }
  let(:range) { Date.parse('01.01.2013')..Date.parse('01.02.2013') }
  subject { ProducerPayout.new(producer, range) }

  it 'knows producer and range' do
    subject.producer.should eq producer
    subject.range.should eq range
  end

  context 'Watched Videos' do
    before do
      video = FactoryGirl.create :video
      vv1   = FactoryGirl.create(:video_view, created_at: Date.parse('01.01.2013'))
      vv2   = FactoryGirl.create(:video_view, created_at: Date.parse('01.03.2013'))
    end

    context 'during a given time range' do
      it 'determines the video hit count' do
        subject.watched_videos.should include vv1
      end
    end
  end
end
