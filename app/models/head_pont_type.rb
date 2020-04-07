# == Schema Information
#
# Table name: head_pont_types
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HeadPontType < ApplicationRecord
    belongs_to :user
end
