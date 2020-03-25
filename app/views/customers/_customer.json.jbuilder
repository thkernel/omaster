json.extract! customer, :id, :customer_type_id, :company_name, :contact_name, :address, :personal_phone, :work_phone, :fleet_number, :city, :country, :email, :agent_id, :user_id, :description, :status, :created_at, :updated_at
json.url customer_url(customer, format: :json)
