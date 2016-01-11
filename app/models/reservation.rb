class Reservation < ActiveRecord::Base
	belongs_to :option
	belongs_to :order
	before_save :set_event_options
	before_save :set_default_team
	before_save :set_default_redeem_code
	validates :name, presence: true
	validates :lastname, presence: true
	validates :age, presence: true
	validates :email, presence: true
	validates :gender, presence: true
	validates :shirt, presence: true

	def sex
		['Female', 'Male']
	end

	def shirtSizes
		['Adult Xs', 'Adult Small', 'Adult Large', 'Adult XL','Adult XXL','Child Small', 'Child Medium', 'Children Large', 'Children X-Large'  ]
	end

	def order_present
	    if order.nil?
	      errors.add(:order, "is not a valid order.")
	    end
	end

	def default_team
		self.team = 'N/A'
	end
	def default_redeem_code
		self.redeemcode = 'N/A'
	end	

	def reservation_price
		self[:price] = option.price
	end

	private

	def set_event_options
		self[:price] = reservation_price
	end

	def set_default_team
		if !self.team?
		   self[:team]= default_team
		end
	end
	def set_default_redeem_code
		if !self.redeemcode?
		   self[:redeemcode]= default_redeem_code
		end
	end	

end
