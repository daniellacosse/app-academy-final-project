json.extract! journal,
:id, :title,
:body, :created_at

json.author journal.user.username
json.tags do
  json.partial! 'tags/tag.json.jbuilder',
                  collection: journal.tags,
                  as: :tag
end