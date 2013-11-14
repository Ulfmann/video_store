class ProducerPayout

  attr_reader :producer
  attr_reader :range

  def initialize(producer, range)
    @producer = producer
    @range    = range
  end

  def video_views
    VideoView.where(created_at: range).to_a
  end

  def video_ids_for_producer
    Video.where(producer_id: producer.id).collect(&:id)
  end

  def payout_for_video_views
    amount = 0
    video_views.each do |vv|
      amount += VideoViewPrice.new.get(vv.id)
    end

    return amount
  end
end
