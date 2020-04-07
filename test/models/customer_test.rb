# == Schema Information
#
# Table name: customers
#
#  id               :bigint           not null, primary key
#  customer_type_id :bigint
#  company_name     :string
#  contact_name     :string
#  address          :string
#  personal_phone   :string
#  work_phone       :string
#  fleet_number     :string
#  city             :string
#  country          :string
#  email            :string
#  agent_id         :bigint
#  user_id          :bigint
#  description      :text
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
