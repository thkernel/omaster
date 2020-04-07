# == Schema Information
#
# Table name: agents
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  last_name   :string
#  gender      :string
#  address     :string
#  phone       :string
#  city        :string
#  country     :string
#  email       :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Agent < ApplicationRecord
  belongs_to :user
end
