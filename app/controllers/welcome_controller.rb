class WelcomeController < ApplicationController

	def index
		@events = Event.all
		@registrations = Registration.all
	end

	def show
		@event = Event.find(params[:id])
		
	end


end
