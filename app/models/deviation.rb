class Deviation < ActiveRecord::Base
    has_attached_file :media

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

    has_many :views, as: :viewable
    has_many :likes, as: :likeable
    has_many :comments, as: :commentable
    belongs_to :user, dependent: :destroy
end