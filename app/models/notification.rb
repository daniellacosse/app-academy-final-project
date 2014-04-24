class Notification < ActiveRecord::Base
  NOTIFICATION_TYPES = {
    0 => " sent you a message."
    1 => " followed you."
    2 => " liked your deviation."
    3 => " liked your gallery."
    4 => " commented on your deviation."
    5 => " commented on your journal."
    6 => " replied to your comment."
  }

  belongs_to :notifiable, polymorphic: true
  belongs_to :user
  belongs_to :notifier

  def message
    User.find(notifier_id) + NOTIFICATION_TYPES[self.notification_id]
  end
end