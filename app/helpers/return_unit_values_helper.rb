module ReturnUnitValuesHelper
	
	def customer(customer_id)
		Customer.find(customer_id)
	end
end
