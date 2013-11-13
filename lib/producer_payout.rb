class ProducerPayout

  attr_reader :producer
  attr_reader :range

  def initialize(producer, range)
    @producer = producer
    @range    = range
  end
end
