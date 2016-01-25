class WelcomeController < ApplicationController

	def index
		@events = Event.all
		@reservations = Reservation.all


	end

	def show
		@event = Event.find(params[:id])
		
	end

	def allevents
		@events = Event.all	
	end	


end
