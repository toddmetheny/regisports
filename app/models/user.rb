class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
	geocoded_by :current_sign_in_ip,
	  :latitude => :lat, :longitude => :lon
	after_validation :geocode         

  belongs_to :role

  def admin?
  	self.role.name == 'admin'
  end

  
end
