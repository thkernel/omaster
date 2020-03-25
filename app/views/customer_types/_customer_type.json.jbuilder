json.extract! customer_type, :id, :name, :description, :status, :created_at, :updated_at
json.url customer_type_url(customer_type, format: :json)
