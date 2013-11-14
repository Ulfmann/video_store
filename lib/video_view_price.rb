class VideoViewPrice

  attr_reader :video_view_id
  attr_reader :producer_id
  attr_reader :range

  def initialize(video_view_id, producer_id, range)
    @video_view_id = video_view_id
    @producer_id = producer_id
    @range = range
  end

  def get
    return (value / 4.0)
  end

  def value
    price_for_subscriptions / video_views_in_range
  end

  def price_for_subscriptions
    subscriptions.collect(&:price)
  end

  def video_view
    @video_view ||= VideoView.find(video_view_id)
  end

  def subscriptions
    video_views_in_range.collect(&:subscription)
  end

  def video_views_in_range
    VideoView.where(video_id: video_ids, created_at: range)
  end

  def video_ids
    Video.where(producer_id: producer_id).collect(&:id)
  end
end
