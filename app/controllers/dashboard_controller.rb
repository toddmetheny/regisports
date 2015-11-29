class DashboardController < ApplicationController

  def index

  	@events = Event.all
  	@options = Option.all
  	@reservations = Reservation.all
    
  end

end
