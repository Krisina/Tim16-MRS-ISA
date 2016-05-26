json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :user_id, :reservation_id, :date, :time, :duration, :table
  json.url reservation_url(reservation, format: :json)
end
