class DashboardController < ApplicationController
  def index
  	@events = Event.all
  	@options = Option.all
  	@reservations = Reservation.all
  	@purchases = Purchase.all
  	@contacts = Contact.all
    authorize! :read, [@events, @options, @reservations]
  end

end
