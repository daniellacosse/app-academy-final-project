class User < ActiveRecord::Base
  attr_reader :password, :password_confirmation

  def self.find_by_credentials(user_params)
    user = User.find_by_username(user_params[:username])
    return user if !!user && user.is_password?(user_params[:password])
    nil
  end

  def self.create_token
    SecureRandom::urlsafe_base64(16)
  end

  before_validation :ensure_token

  has_attached_file :avatar, styles: {
    thumb: "200x200>", icon: "20x20>"
  }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :username,
            :email,
            :date_of_birth,
            presence: true

  validate :password_digest_xor_uid_and_provider

  validates :username,
            :email,
            :token,
            uniqueness: true

  validates_confirmation_of :password
  validates :password, length: { minimum: 7,
                                 allow_nil: true,
                                 message: "length must be at least 7" }

 # <- HANG THIS OUT:
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

  def avatar_isnt_empty
    #temporary solution
    /missing.png/ !~ avatar.to_s
  end
 # ->

  has_many :views, as: :viewable
  has_many(
    :viewed,
    class_name: "View",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :likes, as: :likeable
  has_many(
    :liked,
    class_name: "Like",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
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
    primary_key: :id,
    dependent: :destroy
  )

  def has_seen_notifications
    # look up how to update a bunch of objects at once
    notifications.each do |notification|
      notification.update(was_seen: true)
    end
  end

  def unseen_notifications
    notifications.reject { |n| n.was_seen }
  end

  has_many :followers,
           through: :likes,
           source: :liker

  has_many :followed_users,
           through: :liked,
           source: :likeable,
           source_type: "User"

  has_many :liked_deviations,
           through: :liked,
           source: :likeable,
           source_type: "Deviation"

  has_many :liked_galleries,
           through: :liked,
           source: :likeable,
           source_type: "Gallery"

  has_many :deviations, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :messages
  has_many(
    :authored_messages,
    class_name: "Message",
    foreign_key: :author_id,
    primary_key: :id
  )

  def ensure_token
    self.token ||= User.create_token
    self.verification_key ||= User.create_token
  end

  def reset_token!
    self.token = User.create_token
    self.save!
    self.token
  end

  def password=(naked_password)
    @password = naked_password
    self.password_digest = BCrypt::Password.create(naked_password)
  end

  def is_password?(naked_password)
    BCrypt::Password.new(self.password_digest) == naked_password
  end

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])

    return user if user

    dob = User.parse_fb_date(auth_hash[:extra][:raw_info][:birthday])

    User.create!(provider: auth_hash[:provider],
                 uid: auth_hash[:uid],
                 email: auth_hash[:info][:email],
                 username: auth_hash[:info][:nickname],
                 avatar: User.process_uri(auth_hash[:info][:image]),
                 first_name: auth_hash[:info][:first_name],
                 last_name: auth_hash[:info][:last_name],
                 date_of_birth: dob,
                 is_verified: true)
  end

  private
  def self.process_uri(uri)
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.query = 'type=large'
    avatar_url.to_s
  end

  def self.parse_fb_date(date_string)
    t = Date._strptime(date_string, '%m/%d/%Y')
    Date.new(t[:year], t[:mon], t[:mday])
  end

  def password_digest_xor_uid_and_provider
    unless password_digest.blank? ^ (uid.blank? && provider.blank?)
      errors.add(:base, "Must provide authentication")
    end
  end
end
