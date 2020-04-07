# == Schema Information
#
# Table name: remote_unit_values
#
#  id         :bigint           not null, primary key
#  sender     :string
#  receiver   :string
#  amount     :float
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RemoteUnitValue < ApplicationRecord
  
  belongs_to :user
end
