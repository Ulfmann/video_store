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
      video = FactoryGirl.create(:video, producer: producer)
      another_video = FactoryGirl.create :video
      @vv1   = FactoryGirl.create(:video_view, video: video, created_at: Date.parse('01.01.2013'))
      @vv2   = FactoryGirl.create(:video_view, video: video, created_at: Date.parse('01.03.2013'))
      @vv2   = FactoryGirl.create(:video_view, video: another_video, created_at: Date.parse('01.03.2013'))
    end

    context 'during a given time range' do
      it 'determines the video hits' do
        subject.video_views_for_producer.should include @vv1
        subject.video_views_for_producer.should_not include @vv2
        subject.video_views_for_producer.should_not include @vv3
      end
    end
  end
end
