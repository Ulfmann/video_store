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

  it 'determines the watched videos' do
  end
end
