class DashboardController < ApplicationController
  before_action :authenticate_user!

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
  @reservations_created = @event.reservations.reservations_created
  @reservations_cancelled = @event.reservations.reservations_cancelled
  @reservations_refunded = @event.reservations.reservations_refunded
  @reservations_checkedin = @event.reservations.reservations_checkedin
  @reservations_confirmed = @event.reservations.reservations_confirmed  
  # @reservations = @event.Reservation.where('reservation_status_id = 1')

  @orders = @event.orders
  
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
