class Notification < ActiveRecord::Base
  NOTIFICATION_TYPES = {
    0 => " sent you a message",
    1 => " followed you",
    2 => " liked your deviation",
    3 => " liked your gallery",
    4 => " commented on your deviation",
    5 => " commented on your journal",
    6 => " replied to your comment",
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

  belongs_to :user
  belongs_to(
    :notifier,
    class_name: "User",
    foreign_key: :notifier_id,
    primary_key: :id
  )
  belongs_to :notifiable,
             polymorphic: true

  def message
    return NOTIFICATION_TYPES[self.notification_type]
  end

  def message_url
    the = Rails.application.routes.url_helpers

    case notification_type
      when 0
        return the.message_path(notifiable_id, only_path: true)
      when 1
        return
      when 2
        return the.deviation_path(notifiable.likeable_id, only_path: true)
      when 3
        return the.gallery_path(notifiable.likeable_id, only_path: true)
      when 4
        return the.deviation_path(notifiable.commentable_id, only_path: true)
      when 5
        return the.journal_path(notifiable.commentable_id, only_path: true)
      when 6
        return
    end
  end

  def subject
    if notification_type == 0
      return notifiable.title
    elsif notification_type.between?(2, 3)
      return notifiable.likeable.title
    elsif notification_type.between?(4, 5)
      return notifiable.commentable.title
    end
  end
end
