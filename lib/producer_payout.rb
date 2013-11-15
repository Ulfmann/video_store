class ProducerPayout

  attr_reader :producer
  attr_reader :range

  def initialize(producer, range)
    @producer = producer
    @range    = range
  end

  def calculate
    VideoViewPrice.new(producer.id, range).value
  end
end
