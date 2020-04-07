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

class Locality < ApplicationRecord
  belongs_to :city
end
