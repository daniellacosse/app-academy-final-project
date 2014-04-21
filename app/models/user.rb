class User < ActiveRecord::Base

  before_validation :reset_token!

  attr_reader :password, :password_conf

  validates :username,
            :email,
            :password_digest,
            :token,
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

  def reset_token!
    self.token = User.create_token
    self.save!
    self.token
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
