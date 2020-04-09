# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  login                  :string
#  uui                    :string
#  role_id                :bigint           not null
#  created_by             :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  before_save :generate_uid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Relationships
  belongs_to :role
  has_one :profile, dependent: :destroy
  has_many :customer_types, dependent: :destroy
  has_many :head_pont_types, dependent: :destroy
  has_many :sub_head_pont_types, dependent: :destroy
  has_many :head_ponts, dependent: :destroy
  has_many :sub_head_ponts, dependent: :destroy
  has_many :agents, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :send_unit_values, dependent: :destroy
  has_many :return_unit_values, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :remote_unit_values, dependent: :destroy
  has_many :remote_nafamas, dependent: :destroy
  has_many :checkouts, dependent: :destroy
  has_many :payments, dependent: :destroy



  # Add nested attributes for profile.
  accepts_nested_attributes_for :profile
	
  # Validations

  validates :login, presence: true, uniqueness: true



  private 

  def generate_uid
    begin
      self.uui = SecureRandom.random_number(1_000_000_000)
    end while User.where(uui: self.uui).exists?
  end 

end
