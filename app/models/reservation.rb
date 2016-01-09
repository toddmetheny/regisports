class Reservation < ActiveRecord::Base
	belongs_to :option
	belongs_to :order

	def order_present
	    if order.nil?
	      errors.add(:order, "is not a valid order.")
	    end
	end

	def reservation_price
		self[:price] = option.price
	end

	private

	def set_event_options
		self[:price] = reservation_price
	end

end
