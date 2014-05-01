json.extract! gallery,
:id, :title,
:description, :updated_at

json.author gallery.user.username
json.deviations do
  json.partial! 'deviations/deviation.json.jbuilder',
                collection: gallery.deviations,
                as: :deviation
end
