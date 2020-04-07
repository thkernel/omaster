# == Schema Information
#
# Table name: return_unit_values
#
#  id          :bigint           not null, primary key
#  reason      :string
#  customer_id :bigint
#  amount      :float
#  agent_id    :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ReturnUnitValue < ApplicationRecord
  belongs_to :customer
  belongs_to :agent
  belongs_to :user
end
