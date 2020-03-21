class User < ApplicationRecord
  before_save :generate_uid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Relationships
  has_one :profile, dependent: :destroy


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
