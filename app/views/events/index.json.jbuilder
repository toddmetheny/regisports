json.array!(@events) do |event|
  json.extract! event, :id, :title, :date, :venue, :address, :city, :state, :zipcode, :organizer, :phone, :email, :website, :description, :startTime, :endTime
  json.url event_url(event, format: :json)
end
