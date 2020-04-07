# == Schema Information
#
# Table name: checkouts
#
#  id              :bigint           not null, primary key
#  name            :string
#  minimumbalance  :float
#  maximum_balance :float
#  current_balance :string
#  status          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Checkout < ApplicationRecord
  belongs_to :user
end
