json.extract! checkout, :id, :name, :minimumbalance, :maximum_balance, :current_balance, :status, :user_id, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
