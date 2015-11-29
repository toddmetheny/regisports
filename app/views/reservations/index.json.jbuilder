json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :name, :lastname, :age, :gender, :email, :phone, :team, :shirt, :redeemcode, :option_id
  json.url reservation_url(reservation, format: :json)
end
