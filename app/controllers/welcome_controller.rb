class WelcomeController < ApplicationController

	def index
		@events = Event.all
		@registrations = Registration.all
		@option = @event.option
	end

	def show
		@event = Event.find(params[:id])
		
	end


end
