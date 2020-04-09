module SendUnitValuesHelper

	def customer(customer_id)
		Customer.find(customer_id)
	end
end
