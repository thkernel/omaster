# == Schema Information
#
# Table name: send_unit_values
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

require 'test_helper'

class SendUnitValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
