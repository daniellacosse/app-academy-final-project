class Journal < ActiveRecord::Base
  validates :user_id, :title, :body, presence: true

  belongs_to :user
end
