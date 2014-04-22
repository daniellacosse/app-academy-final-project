class User < ActiveRecord::Base
  attr_reader :password, :password_confirmation

  before_validation :ensure_token

  has_attached_file :avatar# , styles: {
#     thumb: "200x200>", icon: "50x50>"
#   }

  validates_attachment :avatar, content_type: {
    content_type: ["image/jpg", "image/gif", "image/png"]
  }

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

  validates_confirmation_of :password
  validates :password, length:

                              { minimum: 7,
                                allow_nil: true,
                                message: "Password length must be at least 7" }

  has_many :deviations
  has_many :journals
  has_many :messages
  has_many(
    :authored_messages,
    class_name: "Message",
    foreign_key: :author_id,
    primary_key: :id
  )

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
    @password = naked_password
    self.password_digest = BCrypt::Password.create(naked_password)
  end

  def is_password?(naked_password)
    BCrypt::Password.new(self.password_digest) == naked_password
  end
end
