class User < ApplicationRecord
  attr_accessor :price

  has_one :account

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :type

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :admin, -> { where(type: 'Admin')}
  scope :normal, -> { where(type: 'Normal')}

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
