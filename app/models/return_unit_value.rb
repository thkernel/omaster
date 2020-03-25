class ReturnUnitValue < ApplicationRecord
  belongs_to :customer
  belongs_to :agent
  belongs_to :user
end
