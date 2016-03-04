class User < ActiveRecord::Base
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable   

  belongs_to :role

  def admin?
  	self.role.name == 'admin'
  end  
end
