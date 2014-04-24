class Notification < ActiveRecord::Base
  NOTIFICATION_TYPES = {
    0 => " sent you a message.",
    1 => " followed you.",
    2 => " liked your deviation.",
    3 => " liked your gallery.",
    4 => " commented on your deviation.",
    5 => " commented on your journal.",
    6 => " replied to your comment.",
    # 'broadcasting' - followed user
    7 => " uploaded a deviation",
    8 => " wrote a new journal",
    9 => " created a new gallery",
    10 => " liked a deviation",
    11 => " liked a gallery",
    12 => " commented on a deviation",
    13 => " commented on a journal",
    14 => " replied to a comment",
    # 'broadcasting' - liked deviation/comment
    15 => " was commented on"
  }

  belongs_to :notifiable, polymorphic: true
  belongs_to :user
  belongs_to :notifier

  def message
    if (self.notification_type < 7)
     return User.find(notifier_id) + NOTIFICATION_TYPES[self.notification_type]
   end
  end
end