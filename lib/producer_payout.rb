class ProducerPayout

  attr_reader :producer
  attr_reader :range

  def initialize(producer, range)
    @producer = producer
    @range    = range
  end

  def video_views_for_producer
    VideoView.
      where(id: video_ids_for_producer).
      where(created_at: range).to_a
  end

  def video_ids_for_producer
    Video.where(producer_id: producer.id).collect(&:id)
  end

end
