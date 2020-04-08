# == Schema Information
#
# Table name: payments
#
#  id                 :bigint           not null, primary key
#  uid                :string
#  send_unit_value_id :bigint
#  payment_type_id    :bigint
#  checkout_id        :bigint
#  amount             :float
#  shop_id            :integer
#  status             :string
#  user_id            :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :send_unit_value
  belongs_to :payment_type
  belongs_to :user
end
