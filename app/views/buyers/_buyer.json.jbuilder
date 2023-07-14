json.extract! buyer, :id, :name, :location, :farmer_id, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
