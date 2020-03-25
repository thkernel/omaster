class Customer < ApplicationRecord
  belongs_to :customer_type
  belongs_to :agent
  belongs_to :user
end
