json.array!(@registrations) do |registration|
  json.extract! registration, :id, :name, :lastname, :age, :gender, :email, :phone, :team, :shirt, :redeemcode, :option_id
  json.url registration_url(registration, format: :json)
end
