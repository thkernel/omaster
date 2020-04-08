# == Schema Information
#
# Table name: importations
#
#  id         :bigint           not null, primary key
#  uid        :string
#  file_name  :string
#  user_id    :bigint
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ImportationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
