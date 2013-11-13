require 'spec_helper'
load './lib/producer_payout.rb'

describe ProducerPayout do
  let(:producer) { Producer.new(name: 'Test Producer') }
  let(:range) { Date.parse('01.01.2013')..Date.parse('01.02.2013') }

  it 'knows producer and range' do
    pp = ProducerPayout.new(producer, range)
    pp.producer.should eq producer
    pp.range.should eq range
  end
end
