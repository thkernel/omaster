# == Schema Information
#
# Table name: activities
#
#  id              :bigint           not null, primary key
#  network_nature  :string
#  designation     :string
#  customer_number :string
#  pont_head       :string
#  debit           :float
#  credit          :float
#  status          :string
#  importation_id  :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Activity < ApplicationRecord
  belongs_to :importation
end
