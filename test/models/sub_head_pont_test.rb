# == Schema Information
#
# Table name: sub_head_ponts
#
#  id                    :bigint           not null, primary key
#  sub_head_pont_type_id :bigint
#  number                :string
#  description           :text
#  status                :string
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class SubHeadPontTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
