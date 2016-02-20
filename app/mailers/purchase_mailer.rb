class PurchaseMailer < ActionMailer::Base
  default from: "events@regisport.run"
  layout 'mailer'

  def purchase(purchase)
	@purchase = purchase
	@url = 'http://www.regisport.run'
	@order = Order.find(@purchase.order_id)
	mail(to: purchase.customer_email, bcc: 'events@regisport.run' , subject: 'Your Regisport.run order')
  end


end
