class DashboardController < ApplicationController

  def index
  	@events = Event.all
  	@options = Option.all
  	@reservations = Reservation.all
  	@purchases = Purchase.all
  	@contacts = Contact.all
    authorize! :read, [@events, @options, @reservations]
  end

def event_admin
  @event = Event.find(params[:event])
  @options = @event.options
  
end
  def search
  	@events = Event.all
  	@options = Option.all
  	@reservations = Reservation.all
  	@purchases = Purchase.all
  	@contacts = Contact.all
  	# @orders = Order.all
    authorize! :read, [@events, @options, @reservations] 
    if params[:search]
    	@orders = Order.find(:all, :conditions => ['id LIKE ?', "%#{params[:search]}%"]) 		
    else
    	@orders = Order.all
    end 	
  end


end
