class User < ActiveRecord::Base
  attr_reader :password, :password_confirmation

  before_validation :ensure_token

  has_attached_file :avatar, styles: {
    thumb: "200x200>", icon: "25x25>"
  }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :username,
            :email,
            :password_digest,
            :date_of_birth,
            presence: true

  validates :username,
            :email,
            :token,
            uniqueness: true

  validates_confirmation_of :password
  validates :password, length: { minimum: 7,
                                 allow_nil: true,
                                 message: "Password length must be at least 7" }

  has_many :views, as: :viewable
  has_many(
    :viewed,
    class_name: "View",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :likes, as: :likeable
  has_many(
    :liked,
    class_name: "Like",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :commented,
           class_name: "Comment",
           foreign_key: :user_id,
           primary_key: :id

  has_many :notifications
  has_many(
    :notified,
    class_name: "Notification",
    foreign_key: :notifier_id,
    primary_key: :id
  )

  has_many :followed_users,
           through: :liked,
           source: :likeable,
           source_type: "User"

  has_many :liked_deviations,
           through: :liked,
           source: :likeable,
           source_type: "Deviation"

  has_many :deviations
  has_many :galleries
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

  def first_name_isnt_nil_or_empty
    !(first_name.nil? || first_name.empty?)
  end

  def last_name_isnt_nil_or_empty
    !(last_name.nil? || last_name.empty?)
  end

  def entire_name_isnt_nil_or_empty
    first_name_isnt_nil_or_empty && last_name_isnt_nil_or_empty
  end

  def country_isnt_nil_or_empty
    !(country.nil? || country.empty?)
  end

  def biography_isnt_nil_or_empty
    !(biography.nil? || biography.empty?)
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
