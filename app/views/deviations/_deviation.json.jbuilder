json.extract! deviation,
:id, :title,
:description, :is_mature,
:is_commentable, :is_shareable,
:is_likeable, :is_DRM,
:is_CC, :can_remix

json.author deviation.user.username
json.url deviation.media.url
json.thumb_url deviation.media.url(:thumb)
json.tags deviation.tags
json.comments deviation.comments
