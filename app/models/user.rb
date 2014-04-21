class User < ActiveRecord::Base

  before_validation :ensure_token

  attr_reader :password, :password_conf

  validates :username,
            :email,
            :password_digest,
            :country,
            :date_of_birth,
            presence: true

  validates :username,
            :email,
            :token,
            uniqueness: true

  validate :password_confirmation

  def self.create_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_token
    self.token ||= User.create_token
  end

  def reset_token!
    self.token = User.create_token
    self.save!
    self.token
  end

  def self.find_by_credentials(user_params)
    user = User.find_by_username(user_params[:username])
    return user if !!user && user.is_password?(user_params[:password])
    nil
  end

  def password=(naked_password)
    self.password_digest = BCrypt::Password.create(naked_password)
  end

  def is_password?(naked_password)
    BCrypt::Password.new(self.password_digest) == naked_password
  end

  private
  def password_confirmation
    errors[:base] << "passwords must match" unless self.password == self.password_conf
  end
end
