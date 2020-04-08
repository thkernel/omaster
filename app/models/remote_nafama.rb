# == Schema Information
#
# Table name: remote_nafamas
#
#  id          :bigint           not null, primary key
#  uid         :string
#  amount      :float
#  customer_id :bigint
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RemoteNafama < ApplicationRecord
  belongs_to :customer
  belongs_to :user
end
