json.array!(@debats) do |debat|
  json.extract! debat, :id, :title, :description
  json.url debat_url(debat, format: :json)
end
