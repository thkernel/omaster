# == Schema Information
#
# Table name: localities
#
#  id         :bigint           not null, primary key
#  city_id    :bigint
#  name       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LocalityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
