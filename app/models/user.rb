class User < ApplicationRecord
  has_many :tweets, foreign_key: :author_id, dependent: :destroy

  has_many :active_followings, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :followings, through: :active_followings, source: :followed

  has_many :passive_followings, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_followings, source: :follower

  has_secure_password

  before_create :generate_auth_token
  before_save :normalize_username

  validates :full_name, presence: true, length: { maximum: 255 }
  validates :username, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }

  scope :except_user, ->(user) { where.not(id: user.id) }

  def follow(other_user)
    active_followings.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_followings.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  private

  def normalize_username
    self.username = username.to_s.downcase.strip
  end

  def generate_auth_token
    generate_token(:auth_token)
  end

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end
end
