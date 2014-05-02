json.extract! comment, :body, :created_at

json.author comment.commenter.username
json.author_id comment.commenter.id
json.comments comment.comments.each do |comment|
  json.partial! 'comments/comment.json.jbuilder',
                collection: comment.comments,
                as: :comment
end