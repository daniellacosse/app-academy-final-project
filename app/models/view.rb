class View < ActiveRecord::Base
  belongs_to(
    :viewer,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to :viewable, polymorphic: true, dependent: :destroy
end
