json.array! @users do |user|
  json.id post.id
  json.title post.title
  json.content post.content
end