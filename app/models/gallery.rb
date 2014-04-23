class Gallery < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :gallery_deviations, inverse_of: :gallery
  has_many :deviations, through: :gallery_deviations
end
