json.array!(@foodndrinks) do |foodndrink|
  json.extract! foodndrink, :id, :user_id, :foodndrink_id, :food, :drink
  json.url foodndrink_url(foodndrink, format: :json)
end
