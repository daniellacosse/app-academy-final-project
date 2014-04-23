class Journal < ActiveRecord::Base
  validates :user_id, :title, presence: true

  belongs_to :user, dependent: :destroy
  has_many :comments, as: :commentable
end
