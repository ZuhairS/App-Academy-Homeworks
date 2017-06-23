class User < ApplicationRecord
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(supplied_pw)
    BCrypt::Password.new(self.password_digest).is_password?(supplied_pw)
  end

  def password=(supplied_pw)
    @password = supplied_pw
    self.password_digest = BCrypt::Password.create(supplied_pw)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
