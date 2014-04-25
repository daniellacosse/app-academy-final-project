class Message < ActiveRecord::Base
  validates :title, :body, :user_id, :author_id, presence: true

  belongs_to :user
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
end
