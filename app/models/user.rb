class User < ActiveRecord::Base
   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :orders
  before_create :first_admin


  def has_orders?
    Order.where(user_id:self.id).exists?
  end
  private
  def first_admin
    if User.exists?
      self.role="customer"
    else
      self.role="admin"
    end  
  end
end
