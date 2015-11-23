json.array!(@options) do |option|
  json.extract! option, :id, :title, :category, :saleEnd, :price, :fee, :description, :promocode, :event_id
  json.url option_url(option, format: :json)
end
