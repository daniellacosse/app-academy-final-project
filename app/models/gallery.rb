class Gallery < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :gallery_deviations, inverse_of: :gallery, dependent: :destroy
  has_many :deviations, through: :gallery_deviations
end
