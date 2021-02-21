class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  counter_culture :author, column_name: :tweets_count

  delegate :full_name, :username, to: :author, prefix: :author

  scope :recent, -> { order(created_at: :desc) }

  validates :text, presence: true, length: { maximum: 255 }
end
