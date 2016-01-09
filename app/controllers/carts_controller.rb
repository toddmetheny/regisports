class CartsController < ApplicationController

  def show
  	@order = Order.find_by_uuid(session[:order_id])
  	@reservations = @order.reservations
  end

end
