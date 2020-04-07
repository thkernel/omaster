# == Schema Information
#
# Table name: shops
#
#  id           :bigint           not null, primary key
#  locality_id  :bigint
#  name         :string
#  phone_number :string
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Shop < ApplicationRecord
  belongs_to :locality
  belongs_to :user
end
