class Purchase < ActiveRecord::Base
	has_one :order
	has_many :reservations, through: :order



end