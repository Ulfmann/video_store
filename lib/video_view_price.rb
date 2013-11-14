class VideoViewPrice

  attr_reader :video_view_id
  attr_reader :producer_id
  attr_reader :range

  def initialize(video_view_id, producer_id, range)
    @video_view_id = video_view_id
    @producer_id = producer_id
    @range = range
  end

  def value

    amount = 0
    subscriptions.select do |sub|
      amount += subscription_view_price(sub)
      puts amount
    end

    return amount
  end

  def subscription_view_price(sub)
    (sub.price / 4.0) / view_count_for(sub)
  end

  def video_view
    @video_view ||= VideoView.find(video_view_id)
  end

  def subscriptions
    Subscription.find subscription_ids
  end

  def subscription_ids
    VideoView.where(video_id: video_ids).collect(&:subscription_id)
  end

  def view_count_for(sub)
    VideoView.where(subscription_id: sub.id).count
  end

  def video_ids
    Video.where(producer_id: producer_id).collect(&:id)
  end
end
