json.extract! payment, :id, :send_unit_value_id, :payment_type_id, :amount, :shop_id, :status, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
