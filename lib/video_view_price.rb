class VideoViewPrice

  attr_reader :producer_id
  attr_reader :range

  def initialize(producer_id, range)
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

  def view_count_for(sub)
    VideoView.where(subscription_id: sub.id).count
  end

  def subscriptions
    Subscription.find subscription_ids
  end

  def subscription_ids
    watched_videos_in_range.collect(&:subscription_id).uniq
  end

  def watched_videos_in_range
    VideoView.where(video_id: video_ids, created_at: range)
  end

  def video_ids
    Video.where(producer_id: producer_id).collect(&:id)
  end

end
