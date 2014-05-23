json.extract! @user,
  :id, :username,
  :email, :gender,
  :date_of_birth,
  :country, :biography

json.avatar_url @user.avatar.url
json.avatar_thumb_url @user.avatar.url(:thumb)
json.avatar_icon_url  @user.avatar.url(:icon)
json.deviations do
  json.partial! 'deviations/deviation.json.jbuilder',
                collection: @user.deviations,
                as: :deviation
end
json.journals do
  json.partial! 'journals/journal.json.jbuilder',
                collection: @user.journals,
                as: :journal
end
json.galleries do
  json.partial! 'galleries/gallery.json.jbuilder',
                collection: @user.galleries,
                as: :gallery
end
json.notifications do
  json.partial! 'notifications/note.json.jbuilder',
                collection: @user.notifications,
                as: :notification
end
