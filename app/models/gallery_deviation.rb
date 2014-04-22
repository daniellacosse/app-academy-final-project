class GalleryDeviation < ActiveRecord::Base
  validates :gallery_id, :deviation_id, presence: true

  belongs_to :gallery
  belongs_to :deviation
end
