class Comment < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to(
    :commenter,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :comments, as: :commentable, dependent: :destroy
end
