class Gallery < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :deviations, through: :gallery_deviations
end
