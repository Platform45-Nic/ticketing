class User < ApplicationRecord
  has_many :admins, class_name: 'Admin'
  has_many :normals, class_name: 'Normal'

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :admin, -> { where(type: 'Admin')}
  scope :normal, -> { where(type: 'Normal')}

  def full_name
    "#{first_name} #{last_name}"
  end

end
