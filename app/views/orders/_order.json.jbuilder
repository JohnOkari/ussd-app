json.extract! order, :id, :quantity, :delivery_address, :payment_status, :buyer_id, :product_id, :created_at, :updated_at
json.url order_url(order, format: :json)
