class DashboardController < ApplicationController

  def index
  	@events = Event.all
  	@options = Option.all
  	@reservations = Reservation.all
  	@purchases = Purchase.all
    authorize! :read, [@events, @options, @reservations]
  end

end
