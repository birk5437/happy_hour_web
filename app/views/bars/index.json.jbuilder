json.array!(@bars) do |bar|
  json.extract! bar, :id, :name, :address, :phone_number
  json.url bar_url(bar, format: :json)
end
