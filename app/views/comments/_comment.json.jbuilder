json.extract! comment, :body, :created_at

json.author comment.commenter.username
json.author_id comment.commenter.id
json.comments comment.tags.each do |comment|
  json.partial! 'comments/comment.json.jbuilder',
                collection: comment.comments,
                as: :tag
end