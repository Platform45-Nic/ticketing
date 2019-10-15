class User < ApplicationRecord
  attr_accessor :price

  has_many :admins, class_name: 'Admin'
  has_many :normals, class_name: 'Normal'

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  after_initialize :init

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :admin, -> { where(type: 'Admin')}
  scope :normal, -> { where(type: 'Normal')}

  def init
    if current_user.type == "Normal"
      @account = Account.new(user_id: User.find(current_user.id).id, amount: 100).save
      AccountTransaction.new(amount: 100, account_id: @account.id.to_i, note: "initialization").save
    end
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
