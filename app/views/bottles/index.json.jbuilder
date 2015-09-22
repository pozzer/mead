json.array!(@bottles) do |bottle|
  json.extract! bottle, :id
  json.url bottle_url(bottle, format: :json)
end
