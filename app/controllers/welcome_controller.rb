class WelcomeController < ApplicationController

	def index
		@events = Event.all
		@reservations = Reservation.all
		 reset_session

	end

	def show
		@event = Event.find(params[:id])
		
	end


end
