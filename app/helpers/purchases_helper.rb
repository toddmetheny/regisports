module PurchasesHelper

	def cents_to_dollars
		number_to_currency(@purchase.amount.to_d / 100)
	end
end
