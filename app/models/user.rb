class User < ApplicationRecord
  has_many :tweets, foreign_key: :author_id, dependent: :destroy

  has_secure_password

  before_create :generate_auth_token
  before_save :normalize_username

  validates :full_name, presence: true, length: { maximum: 255 }
  validates :username, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }

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
