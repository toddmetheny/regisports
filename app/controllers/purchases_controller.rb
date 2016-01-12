class PurchasesController < ApplicationController

def show
	@purchase = Purchase.find(params[:id])
	@order = Order.find(@purchase.order_id)
end




private

    def purchase_params
      params.require(:purchase).permit(:order, :amount, :customer_email, :customer_id, :email, :customer_card, :order_id)
    end
    
 end