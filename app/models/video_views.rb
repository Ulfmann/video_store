class VideoViews < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription
  belongs_to :video
end
