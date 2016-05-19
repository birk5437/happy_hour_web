json.array!(@specials) do |special|
  json.extract! special, :id, :description, :times, :bar_id
  json.url special_url(special, format: :json)
end
