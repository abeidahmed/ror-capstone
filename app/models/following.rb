class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  counter_culture :follower, column_name: :followings_count
  counter_culture :followed, column_name: :followers_count
end
