class VideoViewPrice

  attr_reader :video_view_id

  def initialize(video_view_id)
    @video_view_id = video_view_id
  end

  def get
    return (value / 4.0)
  end

  def value
    subscription.price / views_for_subscription
  end

  def views_for_subscription
    VideoView.where(subscription_id: subscription.id).count
  end

  def subscription
    @subscription ||= Subscription.find video_view.subscription_id
  end

  def video_view
    @video_view ||= VideoView.find(video_view_id)
  end
end
