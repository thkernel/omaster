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

class SubHeadPont < ApplicationRecord
  belongs_to :sub_head_pont_type
  belongs_to :user
end
