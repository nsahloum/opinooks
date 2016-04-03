json.array!(@reactions) do |reaction|
  json.extract! reaction, :id, :debat_id, :body, :user_id
  json.url reaction_url(reaction, format: :json)
end
