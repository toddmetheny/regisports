class WelcomeController < ApplicationController

	def index
		@events = Event.all
		@registrations = Registration.all
		@event = Event.find(params[:id])
		@option = @event.option
	end

	def show
		@event = Event.find(params[:id])
		
	end


end
