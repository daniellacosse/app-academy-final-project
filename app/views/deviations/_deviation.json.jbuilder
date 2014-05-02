json.extract! deviation,
:id, :title,
:description, :is_mature,
:is_commentable, :is_shareable,
:is_likeable, :is_DRM,
:is_CC, :can_remix

json.author deviation.user.username
json.author_id deviation.user.id
json.url deviation.media.url
json.thumb_url deviation.media.url(:thumb)
json.tags do
  json.partial! 'tags/tag.json.jbuilder',
                collection: deviation.tags,
                as: :tag
end
json.comments do
  json.partial! 'comments/comment.json.jbuilder',
                collection: deviation.comments,
                as: :comment
end