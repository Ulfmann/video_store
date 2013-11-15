class ProducerPayout

  attr_reader :producer
  attr_reader :range

  def initialize(producer, range)
    @producer = producer
    @range    = range #enhance when necessary
  end

  def calculate
    amount = 0
    subscriptions.select do |sub|
      amount += subscription_view_price(sub)
      puts amount
    end

    return amount
  end

  def video_ids
    Video.where(producer_id: producer.id).collect(&:id)
  end

  def subscription_ids
    VideoView.where(video_id: video_ids, created_at: range).collect(&:subscription_id).uniq
  end

  def video_view_count(sub)
    VideoView.where(subscription_id: sub.id, created_at: range).count
  end

  def subscription_view_price(sub)
    (sub.price / 4.0) / video_view_count(sub)
  end

  private

  def subscriptions
    Subscription.find subscription_ids
  end

  def enhance_range
    start = range.first
    stop = range.last

    stop += 1.day
    @range = start..stop
  end
end
