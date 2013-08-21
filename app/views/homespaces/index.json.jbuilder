json.array!(@homespaces) do |homespace|
  json.extract! homespace, :user_id, :partner_id, :post_ids
  json.url homespace_url(homespace, format: :json)
end
