module CreateData
  extend self

  def setup
    delete_everything
    create_new_date
  end

  def delete_everything
    User.delete_all
    Producer.delete_all
    Video.delete_all
    Subscription.delete_all
    VideoView.delete_all
  end

  def create_new_date
    create_users
    create_subscriptions
    create_producers
    create_videos
    create_video_views
  end

  def create_users
    4.times do
      User.create
    end
  end

  def create_subscriptions

    users = User.all.to_a
    users[0].subscriptions.create(
      start_date: Date.parse('01.01.2013'),
      end_date:   Date.parse('31.12.2013'),
      price:      179.4
    )

    users[1].subscriptions.create(
      start_date: Date.parse('15.02.2013'),
      end_date:   Date.parse('14.08.2013'),
      price:      149.7
    )

    users[2].subscriptions.create(
      start_date: Date.parse('23.06.2013'),
      end_date:   Date.parse('22.07.2013'),
      price:      99.95
    )

    users[3].subscriptions.create(
      start_date: Date.parse('11.08.2013'),
      end_date:   Date.parse('10.09.2013'),
      price:      99.95
    )
  end

  def create_producers
    %w(Martin Steve).each do |name|
      Producer.create(name: name)
    end
  end

  def create_videos
    Video.create(producer_id: 1, title: 'Pythagorean theorem - simple explanation')
    Video.create(producer_id: 1, title: 'Rational functions')
    Video.create(producer_id: 2, title: 'What is an integral?')
    Video.create(producer_id: 2, title: 'Sine, cosine, and tangent')
    Video.create(producer_id: 2, title: 'How to solve quadratic equations')
  end

  def create_video_views
    VideoView.create(user_id: 1, subscription_id: 1, video_id: 1, created_at: '10.01.2013')
    VideoView.create(user_id: 3, subscription_id: 3, video_id: 4, created_at: '11.07.2013')
    VideoView.create(user_id: 2, subscription_id: 2, video_id: 1, created_at: '01.08.2013')
    VideoView.create(user_id: 2, subscription_id: 2, video_id: 5, created_at: '01.08.2013')
    VideoView.create(user_id: 1, subscription_id: 1, video_id: 3, created_at: '01.08.2013')
    VideoView.create(user_id: 1, subscription_id: 1, video_id: 2, created_at: '02.08.2013')
    VideoView.create(user_id: 1, subscription_id: 1, video_id: 2, created_at: '09.08.2013')
    VideoView.create(user_id: 2, subscription_id: 2, video_id: 3, created_at: '10.08.2013')
    VideoView.create(user_id: 2, subscription_id: 2, video_id: 2, created_at: '10.08.2013')
    VideoView.create(user_id: 3, subscription_id: 4, video_id: 5, created_at: '11.08.2013')
    VideoView.create(user_id: 1, subscription_id: 1, video_id: 5, created_at: '31.08.2013')
    VideoView.create(user_id: 1, subscription_id: 1, video_id: 1, created_at: '10.10.2013')
  end
end
