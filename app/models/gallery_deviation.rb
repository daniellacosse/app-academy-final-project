class GalleryDeviation < ActiveRecord::Base
  validates :gallery, :deviation_id, presence: true

  belongs_to :gallery, inverse_of: :gallery_deviations
  belongs_to :deviation
end
