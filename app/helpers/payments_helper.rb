module PaymentsHelper
	def checkout(checkout_id)
		Checkout.find(checkout_id)
	end

	def payment_type(payment_type_id)
		PaymentType.find(payment_type_id)
	end
end
