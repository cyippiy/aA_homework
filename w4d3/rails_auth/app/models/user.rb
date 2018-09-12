require 'bcrypt'

class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence:{ message:'password cannot be blank' }
  validates :session_token, presence: true, uniqueness: true

  validates :password, presence: true, length: {minimum: 8, allow_nil: true}

  attr_reader :password

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username,password)
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

end
