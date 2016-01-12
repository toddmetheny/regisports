class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @order = Order.find_by_uuid(session[:order_id])

	  @amount = @order.subtotal.to_i * 100

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
	  
	  purchase = Purchase.create(customer_email: params[:stripeEmail], amount: params[:amount],
	   customer_card: params[:stripeToken], order: params[:order_id], customer_id: customer.id)

	  
	 
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
