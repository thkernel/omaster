# == Schema Information
#
# Table name: payments
#
#  id                 :bigint           not null, primary key
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

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
