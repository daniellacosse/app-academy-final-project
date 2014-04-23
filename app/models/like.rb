class Like < ActiveRecord::Base
  belongs_to(
    :liker,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to :likeable, polymorphic: true
end
