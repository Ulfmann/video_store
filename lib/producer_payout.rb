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


end
