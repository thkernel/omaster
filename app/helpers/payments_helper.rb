module PaymentsHelper
	def checkout(checkout_id)
		Checkout.find(checkout_id)
	end
end
