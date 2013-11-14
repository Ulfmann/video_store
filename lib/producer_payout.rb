class ProducerPayout

  attr_reader :producer
  attr_reader :range

  def initialize(producer, range)
    @producer = producer
    @range    = range
  end

  def video_views
    VideoView.
      where(created_at: range).
      where(video_id: video_ids_for_producer ).to_a
  end

  def video_ids_for_producer
    Video.where(producer_id: producer.id).collect(&:id)
  end

  def calculate
    amount = 0

    video_views.each do |vv|
      amount += VideoViewPrice.new(vv.id, producer.id, range).value
    end

    return amount
  end
end
