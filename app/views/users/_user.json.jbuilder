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
json.journals @user.journals.each do |journal|
  json.extract! journal,
  :id, :title,
  :body, :created_at

  json.author journal.user.username
  json.tags journal.tags
  json.comments journal.comments
end
json.galleries @user.galleries.each do |gallery|
  json.extract! gallery,
  :id, :title,
  :description, :updated_at

  json.author gallery.user.username
  json.deviations do
    json.partial! 'deviations/deviation.json.jbuilder',
                  collection: gallery.deviations,
                  as: :deviation
  end
end