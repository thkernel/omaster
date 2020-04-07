# == Schema Information
#
# Table name: head_ponts
#
#  id                :bigint           not null, primary key
#  head_pont_type_id :bigint
#  number            :string
#  status            :string
#  user_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class HeadPontTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
