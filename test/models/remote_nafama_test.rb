# == Schema Information
#
# Table name: remote_nafamas
#
#  id          :bigint           not null, primary key
#  amount      :float
#  customer_id :bigint
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RemoteNafamaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
