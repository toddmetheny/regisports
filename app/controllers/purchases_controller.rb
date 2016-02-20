class PurchasesController < ApplicationController
  helper PurchasesHelper

def show
	@purchase = Purchase.find_by_uuid(params[:id])
	@order = Order.find(@purchase.order_id)
	PurchaseMailer.purchase(@purchase).deliver_now
  reset_session

end


def index
	@purchases = Purchase.all
  authorize! :read, @purchases
	
end


  def destroy
  	@purchase = Purchase.find_by_uuid(params[:id])
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

    def purchase_params
      params.require(:purchase).permit(:order, :amount, :customer_email, :customer_id, :email, :customer_card, :order_id)
    end
    

 end