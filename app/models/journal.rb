class Journal < ActiveRecord::Base
  validates :user_id, :title, presence: true

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
end
