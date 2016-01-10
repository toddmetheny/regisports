class Reservation < ActiveRecord::Base
	belongs_to :option
	belongs_to :order
	before_save :set_event_options
	validates :name, presence: true
	validates :lastname, presence: true
	validates :age, presence: true
	validates :email, presence: true
	validates :gender, presence: true
	validates :shirt, presence: true

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
