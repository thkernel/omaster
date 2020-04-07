# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  gender     :string
#  address    :string
#  phone      :string
#  country    :string
#  city       :string
#  service_id :bigint
#  about      :text
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ApplicationRecord
    belongs_to :user

    has_one_attached :avatar
end
