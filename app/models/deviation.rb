class Deviation < ActiveRecord::Base

    # TODO: has_attached_file :media

    validates :user_id,
              :title,
              presence: true

    validates :is_mature,
              :is_commentable,
              :is_shareable,
              :is_likeable,
              :is_DRM,
              :is_CC,
              :can_remix,
              inclusion: { in: [true, false], message: "something's up" }

    belongs_to :user
end