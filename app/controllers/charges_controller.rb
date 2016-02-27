class ChargesController < ApplicationController

	def new
	end

	def create
	  # Amount in cents
	  @order = Order.find_by_uuid(session[:order_id])
	  @reservations = @order.reservations
	  @total_amount = @order.total * 100
	  @total_convert = @total_amount.to_i
	  @amount = @total_convert

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => @order.id,
	    :currency    => 'usd'


	  )
	  
	  purchase = Purchase.create(customer_email: params[:stripeEmail], amount: (@amount),
	   customer_card: params[:stripeToken], order_id: (@order.id), customer_id: customer.id)


	 
	if charge.save
		@order_id = @order.update_attributes(order_status_id: 2)	
		#redirect_to @order
		redirect_to purchase
		reset_session

	end   

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
