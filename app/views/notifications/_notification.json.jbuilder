json.extract! notification,
:message, :message_url,
:subject

json.notifier notification.notifier.username
json.notifier_url user_url(notification.notifier)
json.time_ago time_ago_in_words(notification.created_at)
