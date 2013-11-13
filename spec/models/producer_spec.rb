require 'spec_helper'

describe Producer do

  it 'has videos' do
    producer = Producer.create
    video = Video.create(producer_id: producer.id)
    producer.videos.should include video
  end
end
