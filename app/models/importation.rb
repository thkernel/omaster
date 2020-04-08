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

class Importation < ApplicationRecord
  before_save :generate_uid
  belongs_to :user

  has_many :activities, dependent: :destroy




  private

  def generate_uid
  	self.uid = Time.now.strftime("%Y%m%d%H%M%S")
  end
end
