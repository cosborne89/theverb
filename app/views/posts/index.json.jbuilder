json.array!(@posts) do |post|
  json.extract! post, :title, :category, :author_id, :homespace_id, :body, :link
  json.url post_url(post, format: :json)
end
