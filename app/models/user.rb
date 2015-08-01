class User < ActiveRecord::Base
  validates  :email, :password,  presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin customer]
  has_many :orders

  before_save :first_admin

  private
  def first_admin
    if User.exists?
      self.role="customer"
    else
      self.role="admin"
    end  
  end
end
