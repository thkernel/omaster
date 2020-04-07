# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  phone      :string
#  fax        :string
#  po_box     :string
#  city       :string
#  country    :string
#  website    :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
end
