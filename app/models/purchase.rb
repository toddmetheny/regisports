class Purchase < ActiveRecord::Base
	has_one :order
	has_many :reservations, through: :order
	before_create :create_unique_identifier

  def to_param
     uuid
   end

   def create_unique_identifier
     self.uuid = SecureRandom.uuid
   end



end